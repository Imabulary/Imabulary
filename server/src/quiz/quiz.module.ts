import { Module } from '@nestjs/common';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { StorageModule } from 'src/storage/storage.module';
import { UsersService } from 'src/users';
import { QuizController } from './quiz.controller';
import { QuizService } from './quiz.service';
import { WalletService } from 'src/wallet/wallet.service';

@Module({
  imports: [StorageModule],
  providers: [
    QuizService,
    PrismaService,
    UsersService,
    FeedbackService,
    WalletService,
  ],
  controllers: [QuizController],
})
export class QuizModule {}
