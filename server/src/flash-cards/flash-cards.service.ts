import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { ServerPagination } from 'src/shared/types';

@Injectable()
export class FlashCardsService {
  constructor(private readonly prisma: PrismaClient) {}

  findAll(pagination: ServerPagination) {
    return this.prisma.cards.findMany({ ...pagination });
  }
}
