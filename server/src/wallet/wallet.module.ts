import { Module } from '@nestjs/common';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { ProductsRepository, ProductsService } from 'src/products';
import { StorageModule } from 'src/storage/storage.module';
import { UsersService } from 'src/users';
import { WalletController } from './wallet.controller';
import { WalletRepository } from './wallet.repository';
import { WalletService } from './wallet.service';
import { UsersRepository } from 'src/users/users.repository';

@Module({
  controllers: [WalletController],
  imports: [StorageModule],
  providers: [
    PrismaService,
    FeedbackService,
    WalletService,
    UsersService,
    WalletRepository,
    ProductsService,
    ProductsRepository,
    UsersRepository,
  ],
  exports: [WalletService],
})
export class WalletModule {}
