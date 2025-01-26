import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { ProductsRepository, ProductsService } from 'src/products';
import { StorageModule } from 'src/storage/storage.module';
import { UsersService } from 'src/users';
import { WalletService } from 'src/wallet/wallet.service';
import { FeedbackController } from './feedback.controller';
import { FeedbackService } from './feedback.service';
import { WalletRepository } from 'src/wallet/wallet.repository';
import { UsersRepository } from 'src/users/users.repository';

@Module({
  imports: [StorageModule],
  providers: [
    FeedbackService,
    PrismaService,
    UsersService,
    WalletService,
    ProductsService,
    ProductsRepository,
    WalletRepository,
    UsersRepository,
  ],
  controllers: [FeedbackController],
})
export class FeedbackModule {}
