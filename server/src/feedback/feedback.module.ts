import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { StorageModule } from 'src/storage/storage.module';
import { UsersService } from 'src/users';
import { FeedbackController } from './feedback.controller';
import { FeedbackService } from './feedback.service';

@Module({
  imports: [StorageModule],
  providers: [FeedbackService, PrismaService, UsersService],
  controllers: [FeedbackController],
})
export class FeedbackModule {}
