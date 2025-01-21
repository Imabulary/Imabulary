import { Module } from '@nestjs/common';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { ProductsRepository, ProductsService } from 'src/products';
import { StorageModule } from 'src/storage/storage.module';
import { UsersService } from 'src/users';
import { WalletModule } from 'src/wallet/wallet.module';
import { SetsController } from './sets.controller';
import { SetsService } from './sets.service';

@Module({
  controllers: [SetsController],
  imports: [WalletModule, StorageModule],
  providers: [
    SetsService,
    PrismaService,
    FeedbackService,
    UsersService,
    ProductsService,
    ProductsRepository,
  ],
})
export class SetsModule {}
