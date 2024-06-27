import { Module } from '@nestjs/common';
import { FlashCardsService } from './flashcards.service';
import { FlashCardsController } from './flashcards.controller';
import { UsersService } from 'src/users';
import { PrismaService } from 'src/prisma';
import { StorageService } from 'src/storage/storage.service';
import { VisionService } from 'src/vision/vision.service';
import { AssistantService } from 'src/assistant/assistant.service';
import { TranslatorService } from 'src/translator/translator.service';
import { CashbackService } from 'src/cashback/cashback.service';

@Module({
  controllers: [FlashCardsController],
  providers: [
    FlashCardsService,
    PrismaService,
    UsersService,
    StorageService,
    VisionService,
    AssistantService,
    TranslatorService,
    CashbackService,
  ],
})
export class FlashCardsModule {}
