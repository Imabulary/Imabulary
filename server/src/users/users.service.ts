import { Inject, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import admin from 'firebase-admin';
import { CustomPrismaService } from 'nestjs-prisma';
import { FeedbackService } from 'src/feedback/feedback.service';
import { StorageService } from 'src/storage/storage.service';
import { IBucketFolders } from 'src/storage/utils';
import { type ExtendedPrismaClient } from '../prisma';
import { CreateUserDTO } from './dto/user.dto';

@Injectable()
export class UsersService {
  constructor(
    @Inject('PrismaService')
    private readonly prisma: CustomPrismaService<ExtendedPrismaClient>,
    private readonly storage: StorageService,
    private readonly feedback: FeedbackService,
  ) {}

  /**
   * This method uses extended PrismaService, which creates a wallet with a cashback and award for it
   * every time `create` function of `users` model is triggered.
   *
   * Check `server/src/prisma/prisma.extension.ts:3` for implementation details
   */
  async findOneOrCreate(createUserDto: CreateUserDTO) {
    const { uid, email } = createUserDto;

    const data = { externalId: uid, email };

    const user = await this.findOne(data);

    return user || this.prisma.client.users.create({ data });
  }

  async findOne(
    where: Prisma.UsersWhereUniqueInput,
    include?: Prisma.UsersInclude,
  ) {
    return this.prisma.client.users.findFirst({ where, include });
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

    await this.prisma.client.$transaction(async (prisma) => {
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
