import { Module } from '@nestjs/common';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { ProductsRepository, ProductsService } from 'src/products';
import { StorageModule } from 'src/storage/storage.module';
import { UsersService } from 'src/users';
import { WalletModule } from 'src/wallet/wallet.module';
import { QuizController } from './quiz.controller';
import { QuizService } from './quiz.service';

@Module({
  imports: [StorageModule, WalletModule],
  providers: [
    QuizService,
    PrismaService,
    FeedbackService,
    UsersService,
    ProductsService,
    ProductsRepository,
  ],
  controllers: [QuizController],
})
export class QuizModule {}
