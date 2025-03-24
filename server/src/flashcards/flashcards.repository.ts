import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma';
import { UpdateFlashcardDTO } from './dto';

@Injectable()
export class FlashcardsRepository {
  constructor(private readonly prisma: PrismaService) {}

  findOne(where: Prisma.CardsWhereUniqueInput) {
    return this.prisma.cards.findFirst({ where });
  }

  update(where: Prisma.CardsWhereUniqueInput, data: UpdateFlashcardDTO) {
    return this.prisma.cards.update({ where, data });
  }
}
