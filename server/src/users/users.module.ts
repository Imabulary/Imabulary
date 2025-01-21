import { Module } from '@nestjs/common';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { ProductsRepository, ProductsService } from 'src/products';
import { StorageService } from 'src/storage/storage.service';
import { WalletModule } from 'src/wallet/wallet.module';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';

@Module({
  controllers: [UsersController],
  imports: [WalletModule],
  providers: [
    UsersService,
    PrismaService,
    StorageService,
    FeedbackService,
    ProductsService,
    ProductsRepository,
  ],
})
export class UsersModule {}
