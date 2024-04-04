import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { ServerPagination } from 'src/shared/types';

@Injectable()
export class FlashCardsService {
  constructor(private readonly prisma: PrismaService) {}

  async findAll(pagination: ServerPagination) {
    const [cards, total] = await this.prisma.$transaction([
      this.prisma.cards.findMany({
        ...pagination,
        orderBy: { createdAt: 'desc' },
      }),
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
