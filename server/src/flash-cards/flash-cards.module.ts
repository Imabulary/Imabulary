import { Module } from '@nestjs/common';
import { FlashCardsService } from './flash-cards.service';
import { FlashCardsController } from './flash-cards.controller';
import { UsersService } from 'src/users';
import { PrismaService } from 'src/prisma';

@Module({
  controllers: [FlashCardsController],
  providers: [FlashCardsService, PrismaService, UsersService],
})
export class FlashCardsModule {}
