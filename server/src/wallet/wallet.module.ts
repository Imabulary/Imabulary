import { Module } from '@nestjs/common';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { StorageModule } from 'src/storage/storage.module';
import { UsersService } from 'src/users';
import { WalletController } from './wallet.controller';
import { WalletService } from './wallet.service';

@Module({
  controllers: [WalletController],
  imports: [StorageModule],
  providers: [PrismaService, FeedbackService, WalletService, UsersService],
  exports: [WalletService],
})
export class WalletModule {}
