import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { MulterModule } from '@nestjs/platform-express';
import { memoryStorage } from 'multer';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AssistantModule } from './assistant/assistant.module';
import { FlashCardsModule } from './flash-cards/flash-cards.module';
import { PrismaService } from './prisma/prisma.service';
import { TranslatorModule } from './translator/translator.module';
import { VisionModule } from './vision/vision.module';
import { StorageModule } from './storage/storage.module';
import { UsersModule } from './users/users.module';

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
  ],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}
