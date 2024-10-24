import { Inject, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { CustomPrismaService } from 'nestjs-prisma';
import { type ExtendedPrismaClient } from '../prisma';
import { CreateUserDTO } from './dto/user.dto';
import { StorageService } from 'src/storage/storage.service';
import { IBucketFolders } from 'src/storage/utils';
import admin from 'firebase-admin';
import { FeedbackService } from 'src/feedback/feedback.service';

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

    const user = await this.findOne({ externalId: uid, email });

    return (
      user ||
      this.prisma.client.users.create({ data: { externalId: uid, email } })
    );
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
      this.storage.delete(IBucketFolders.IMAGE, name),
    );

    const soundDeletePromises = soundNames.map((name) =>
      this.storage.delete(IBucketFolders.AUDIO, name),
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

    return {
      message: true,
    };
  }
}
