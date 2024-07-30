import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { MulterModule } from '@nestjs/platform-express';
import { memoryStorage } from 'multer';
import { AssistantModule } from './assistant/assistant.module';
import { FlashCardsModule } from './flashcards/flashcards.module';
import { SetsModule } from './sets/sets.module';
import { StorageModule } from './storage/storage.module';
import { TranslatorModule } from './translator/translator.module';
import { UsersModule } from './users/users.module';
import { TextToSpeechModule } from './text-to-speech/text-to-speech.module';
import { VisionModule } from './vision/vision.module';
import { WalletModule } from './wallet/wallet.module';

@Module({
  imports: [
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
    TextToSpeechModule,
  ],
})
export class AppModule {}
