import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { StorageModule } from 'src/storage/storage.module';
import { UsersService } from 'src/users';
import { FeedbackController } from './feedback.controller';
import { FeedbackService } from './feedback.service';
import { WalletService } from 'src/wallet/wallet.service';

@Module({
  imports: [StorageModule],
  providers: [FeedbackService, PrismaService, UsersService, WalletService],
  controllers: [FeedbackController],
})
export class FeedbackModule {}
