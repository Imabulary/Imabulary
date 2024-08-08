import { Module } from '@nestjs/common';
import { CustomPrismaModule } from 'nestjs-prisma';
import { AssistantService } from 'src/assistant/assistant.service';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { StorageService } from 'src/storage/storage.service';
import { TranslatorService } from 'src/translator/translator.service';
import { UsersService } from 'src/users';
import { VisionService } from 'src/vision/vision.service';
import { FlashCardsController } from './flashcards.controller';
import { FlashCardsService } from './flashcards.service';
import { WalletModule } from 'src/wallet/wallet.module';
import { SoundService } from 'src/sound/sound.service';

@Module({
  controllers: [FlashCardsController],
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
    WalletModule,
  ],
  providers: [
    FlashCardsService,
    PrismaService,
    StorageService,
    VisionService,
    AssistantService,
    TranslatorService,
    UsersService,
    SoundService,
  ],
})
export class FlashCardsModule {}
