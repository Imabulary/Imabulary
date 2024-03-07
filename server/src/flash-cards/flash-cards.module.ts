import { Module } from '@nestjs/common';
import { FlashCardsService } from './flash-cards.service';
import { FlashCardsController } from './flash-cards.controller';
import { PrismaClient } from '@prisma/client';

@Module({
  controllers: [FlashCardsController],
  providers: [FlashCardsService, PrismaClient],
})
export class FlashCardsModule {}
