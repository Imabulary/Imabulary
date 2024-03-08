import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { ServerPagination } from 'src/shared/types';

@Injectable()
export class FlashCardsService {
  constructor(private readonly prisma: PrismaClient) {}

  async findAll(pagination: ServerPagination) {
    // return this.prisma.cards.findMany({ ...pagination });
    const [cards, total] = await this.prisma.$transaction([
      this.prisma.cards.findMany({ ...pagination }),
      this.prisma.cards.count(),
    ]);

    return {
      result: cards,
      meta: {
        pagination: {
          total,
        },
      },
    };
  }
}
