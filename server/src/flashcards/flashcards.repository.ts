// src/users/user.repository.ts

import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Cards, CardsOnSets } from '@prisma/client';
import * as ICardsRepo from './flashcards.repository.interface';

@Injectable()
export class FlashcardsRepository implements ICardsRepo.IFlashcardsRepository {
  constructor(private prisma: PrismaService) {}

  async findAll({
    where,
    include,
    take,
    skip,
    orderBy,
  }: ICardsRepo.FlashcardsFindAllType): Promise<Cards[]> {
    return this.prisma.cards.findMany({
      where,
      include,
      take,
      skip,
      orderBy,
    });
  }

  async findOne({
    where,
  }: ICardsRepo.FlashcardsFindOneType): Promise<Cards | null> {
    return this.prisma.cards.findUnique({ where });
  }

  async create({ data }: ICardsRepo.FlashcardsCreateType): Promise<Cards> {
    return this.prisma.cards.create({ data });
  }

  async softDelete<T extends string | string[]>({
    id,
  }: {
    id: T;
  }): Promise<ICardsRepo.SoftDeleteReturnType<T>> {
    if (Array.isArray(id)) {
      await this.prisma.$transaction(async (prisma) => {
        const result = await prisma.cards.updateMany({
          where: {
            id: {
              in: id,
            },
          },
          data: {
            userId: null,
            deletedAt: new Date(),
          },
        });
        await prisma.cardsOnSets.deleteMany({
          where: {
            flashcardId: {
              in: id,
            },
          },
        });
        return result;
      });
      return [] as ICardsRepo.SoftDeleteReturnType<T>;
    } else {
      const [result] = await Promise.all([
        this.prisma.cards.update({
          where: { id },
          data: {
            userId: null,
            deletedAt: new Date(),
          },
        }),
        this.prisma.cardsOnSets.deleteMany({
          where: { flashcardId: id },
        }),
      ]);
      return result as ICardsRepo.SoftDeleteReturnType<T>;
    }
  }

  async findAndFilterAll({
    where,
    orderBy,
    take,
    skip,
    include,
  }: ICardsRepo.FlashcardsFindAllAndFilterType): Promise<{
    result: Cards[];
    total: number;
  }> {
    const [result, total] = await this.prisma.$transaction([
      this.prisma.cards.findMany({
        take,
        skip,
        orderBy,
        where,
        include,
      }),
      this.prisma.cards.count({ where }),
    ]);

    return { result, total };
  }

  async upsertCardsOnSets({
    flashcardIds,
    setId,
  }: ICardsRepo.CardsOnSetsUpsertType): Promise<CardsOnSets[]> {
    const queries = flashcardIds.map((flashcardId) =>
      this.prisma.cardsOnSets.upsert({
        create: { setId, flashcardId },
        where: { setId_flashcardId: { setId, flashcardId } },
        update: {},
      }),
    );

    return await Promise.all(queries);
  }

  async deleteManyCardsOnSets({
    where,
  }: ICardsRepo.CardsOnSetsDeleteManyType): Promise<void> {
    this.prisma.cardsOnSets.deleteMany({ where });
  }
}
