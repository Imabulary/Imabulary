import { Module } from '@nestjs/common';
import { FeedbackController } from './feedback.controller';
import { FeedbackService } from './feedback.service';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { UsersService } from 'src/users';
import { CustomPrismaModule } from 'nestjs-prisma';

@Module({
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
  ],
  providers: [FeedbackService, PrismaService, UsersService],
  controllers: [FeedbackController],
})
export class FeedbackModule {}
