import { Module } from '@nestjs/common';
import { QuizService } from './quiz.service';
import { QuizController } from './quiz.controller';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { CustomPrismaModule } from 'nestjs-prisma';
import { UsersService } from 'src/users';
import { StorageModule } from 'src/storage/storage.module';

@Module({
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
    StorageModule,
  ],
  providers: [QuizService, PrismaService, UsersService],
  controllers: [QuizController],
})
export class QuizModule {}
