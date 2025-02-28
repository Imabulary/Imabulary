import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import admin from 'firebase-admin';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { StorageService } from 'src/storage/storage.service';
import { IBucketFolders } from 'src/storage/utils';
import { WalletService } from 'src/wallet/wallet.service';
import { CreateUserDTO } from './dto/user.dto';
import { isEmpty } from 'lodash';

@Injectable()
export class UsersService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly storage: StorageService,
    private readonly feedback: FeedbackService,
    private readonly wallet: WalletService,
  ) {}

  async findOneOrCreate(createUserDto: CreateUserDTO) {
    const { uid, email } = createUserDto;

    const user = await this.findOne(
      !isEmpty(email) ? { externalId: uid, email } : { externalId: uid },
    );

    if (!user) {
      const newUser = await this.prisma.users.create({
        data: { externalId: uid, email },
      });

      await this.wallet.create(newUser.id);

      return newUser;
    }

    return user;
  }

  async findOne(
    where: Prisma.UsersWhereUniqueInput,
    include?: Prisma.UsersInclude,
  ) {
    return this.prisma.users.findFirst({ where, include });
  }

  async delete(uid: string) {
    const user = await this.findOne(
      { externalId: uid },
      {
        flashcards: true,
        feedbacks: true,
      },
    );

    const soundNames = [];
    const imageNames = [];

    user.flashcards.forEach((flashcard) => {
      soundNames.push(flashcard.audio_name);
      imageNames.push(flashcard.image_name);
    });

    const imageDeletePromises = imageNames.map((name) =>
      this.storage.delete(name, IBucketFolders.IMAGE),
    );

    const soundDeletePromises = soundNames.map((name) =>
      this.storage.delete(name, IBucketFolders.AUDIO),
    );

    await this.prisma.$transaction(async (prisma) => {
      await Promise.all([...imageDeletePromises, ...soundDeletePromises]);

      this.feedback.updateMany(
        {
          user: {
            externalId: uid,
          },
        },
        {
          userId: null,
        },
      );

      await prisma.users.delete({
        where: { externalId: uid },
      });

      await admin.auth().deleteUser(uid);
    });

    return true;
  }
}
