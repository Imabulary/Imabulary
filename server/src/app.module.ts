import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { MulterModule } from '@nestjs/platform-express';
import { SentryModule } from '@sentry/nestjs/setup';
import { memoryStorage } from 'multer';
import { AssistantModule } from './assistant/assistant.module';
import { FeedbackModule } from './feedback/feedback.module';
import { FlashCardsModule } from './flashcards/flashcards.module';
import { NlpService } from './nlp/nlp.service';
import { QuizModule } from './quiz/quiz.module';
import { SetsModule } from './sets/sets.module';
import { StorageModule } from './storage/storage.module';
import { TranslatorModule } from './translator/translator.module';
import { UsersModule } from './users/users.module';
import { VisionModule } from './vision/vision.module';
import { WalletModule } from './wallet/wallet.module';
import { LoggerModule } from './utils/logger/';

@Module({
  imports: [
    SentryModule.forRoot(),
    MulterModule.register({
      storage: memoryStorage(),
    }),
    ConfigModule.forRoot(),
    FlashCardsModule,
    AssistantModule,
    VisionModule,
    TranslatorModule,
    StorageModule,
    UsersModule,
    SetsModule,
    WalletModule,
    FeedbackModule,
    QuizModule,
    LoggerModule,
  ],
  providers: [NlpService],
})
export class AppModule {}
