import { Module } from '@nestjs/common';
import { QuizService } from './quiz.service';
import { QuizController } from './quiz.controller';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { CustomPrismaModule } from 'nestjs-prisma';
import { UsersService } from 'src/users';
import { StorageModule } from 'src/storage/storage.module';
import { FeedbackModule } from 'src/feedback/feedback.module';
import { FeedbackService } from 'src/feedback/feedback.service';

@Module({
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
    StorageModule,
  ],
  providers: [QuizService, PrismaService, UsersService, FeedbackService],
  controllers: [QuizController],
})
export class QuizModule {}
