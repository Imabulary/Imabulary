import { Module } from '@nestjs/common';
import { AssistantService } from 'src/assistant/assistant.service';
import { FeedbackService } from 'src/feedback/feedback.service';
import { NlpService } from 'src/nlp';
import { PrismaService } from 'src/prisma';
import { QuizService } from 'src/quiz/quiz.service';
import { SoundService } from 'src/sound/sound.service';
import { StorageService } from 'src/storage/storage.service';
import { TranslatorService } from 'src/translator/translator.service';
import { UsersService } from 'src/users';
import { VisionService } from 'src/vision/vision.service';
import { WalletModule } from 'src/wallet/wallet.module';
import { FlashCardsController } from './flashcards.controller';
import { FlashCardsService } from './flashcards.service';
import { FlashcardsRepository } from './flashcards.repository';

@Module({
  controllers: [FlashCardsController],
  imports: [WalletModule],
  providers: [
    FlashCardsService,
    PrismaService,
    StorageService,
    VisionService,
    AssistantService,
    TranslatorService,
    WalletModule,
    FeedbackService,
    UsersService,
    SoundService,
    QuizService,
    NlpService,
    FlashcardsRepository,
  ],
})
export class FlashCardsModule {}
