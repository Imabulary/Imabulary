import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import admin from 'firebase-admin';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { ProductsService } from 'src/products/products.service';
import { subscriptionIds } from 'src/products/utils';
import { StorageService } from 'src/storage/storage.service';
import { IBucketFolders } from 'src/storage/utils';
import { WalletService } from 'src/wallet/wallet.service';
import { CreateUserDTO, UpdateUserDTO } from './dto/user.dto';
import { UsersRepository } from './users.repository';
import { UserNotFoundException } from './utils/users.exception';

@Injectable()
export class UsersService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly storage: StorageService,
    private readonly feedback: FeedbackService,
    private readonly wallet: WalletService,
    private readonly products: ProductsService,
    private readonly repository: UsersRepository,
    private readonly product: ProductsService,
  ) {}

  async findOneOrCreate(createUserDto: CreateUserDTO) {
    const { uid, email } = createUserDto;

    const user = await this.repository.findOne({
      where: { externalId: uid, email },
    });

    if (!user) {
      const freeSubscription = await this.products.findOne({
        internalId: subscriptionIds.IMABULARY_FREE,
      });

      const newUser = await this.prisma.users.create({
        data: { externalId: uid, email, productId: freeSubscription.id },
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
    const user = await this.repository.findOne({ where, include });

    if (!user) {
      throw new UserNotFoundException(where);
    }

    return user;
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

  update(userId: string, updateUserDto: UpdateUserDTO) {
    return this.prisma.users.update({
      where: { id: userId },
      data: updateUserDto,
    });
  }

  async findSubscription(userId: string) {
    const user = await this.findOne({ id: userId });
    const subscription = await this.product.findOne({ id: user.productId });

    return subscription;
  }
}
