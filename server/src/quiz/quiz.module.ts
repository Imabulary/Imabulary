import { Module } from '@nestjs/common';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { StorageModule } from 'src/storage/storage.module';
import { UsersService } from 'src/users';
import { QuizController } from './quiz.controller';
import { QuizService } from './quiz.service';

@Module({
  imports: [StorageModule],
  providers: [QuizService, PrismaService, UsersService, FeedbackService],
  controllers: [QuizController],
})
export class QuizModule {}
