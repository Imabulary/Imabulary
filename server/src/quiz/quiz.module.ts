import { Module } from '@nestjs/common';
import { QuizService } from './quiz.service';
import { QuizController } from './quiz.controller';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { CustomPrismaModule } from 'nestjs-prisma';
import { UsersService } from 'src/users';

@Module({
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
  ],
  providers: [QuizService, PrismaService, UsersService],
  controllers: [QuizController],
})
export class QuizModule {}
