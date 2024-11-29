import { Module } from '@nestjs/common';
import { CustomPrismaModule } from 'nestjs-prisma';
import { FeedbackService } from 'src/feedback/feedback.service';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { StorageModule } from 'src/storage/storage.module';
import { UsersService } from 'src/users';
import { QuizController } from './quiz.controller';
import { QuizService } from './quiz.service';

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
