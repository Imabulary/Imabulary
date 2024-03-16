import { Module } from '@nestjs/common';
import { MulterModule } from '@nestjs/platform-express';
import { memoryStorage } from 'multer';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { PrismaService } from './prisma/prisma.service';
import { FlashCardsModule } from './flash-cards/flash-cards.module';
import { AssistantModule } from './assistant/assistant.module';
import { StorageModule } from './storage/storage.module';
import { VisionModule } from './vision/vision.module';
import { TranslatorModule } from './translator/translator.module';

@Module({
  imports: [
    MulterModule.register({
      storage: memoryStorage(),
    }),
    ConfigModule.forRoot(),
    FlashCardsModule,
    AssistantModule,
    StorageModule,
    VisionModule,
    TranslatorModule,
  ],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}
