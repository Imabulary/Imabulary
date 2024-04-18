import { Module } from '@nestjs/common';
import { FlashCardsService } from './flashcards.service';
import { FlashCardsController } from './flashcards.controller';
import { UsersService } from 'src/users';
import { PrismaService } from 'src/prisma';

@Module({
  controllers: [FlashCardsController],
  providers: [FlashCardsService, PrismaService, UsersService],
})
export class FlashCardsModule {}
