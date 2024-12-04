import { Cards, CardsOnSets, Prisma } from '@prisma/client';

export type FlashcardsFindAllType = {
  where?: Prisma.CardsWhereInput;
  orderBy?:
    | Prisma.CardsOrderByWithRelationInput
    | Prisma.CardsOrderByWithRelationInput[];
  take?: number;
  skip?: number;
  include?: Prisma.CardsInclude;
};

export type CardsOnSetsUpsertType = {
  flashcardIds: string[];
  setId: string;
};

export type FlashcardsSoftDeleteType = {
  id: string | string[];
};

export type CardsOnSetsDeleteManyType = {
  where: Prisma.CardsOnSetsWhereInput;
};

export type FlashcardsUpdateManyType = {
  where?: Prisma.CardsWhereInput;
  data: Prisma.CardsUpdateManyMutationInput;
};

export type FlashcardsUpdateOneType = {
  where: Prisma.CardsWhereUniqueInput;
  data: Prisma.XOR<Prisma.CardsUpdateInput, Prisma.CardsUncheckedUpdateInput>;
};

export type FlashcardsFindOneType = {
  where: Prisma.CardsWhereUniqueInput;
};

export type FlashcardsCreateType = {
  data: Prisma.XOR<Prisma.CardsUncheckedCreateInput, Prisma.CardsCreateInput>;
};

export type FlashcardsCountType = {
  where: Prisma.CardsWhereInput;
};

export type SoftDeleteReturnType<T> = T extends string[] ? Cards[] : Cards;

export interface IFlashcardsRepository {
  /**
   * Get all flashcards
   * @returns Promise with array of flashcards
   */
  findAll(params: FlashcardsFindAllType): Promise<Cards[]>;
  /**
   * Find flashcard by id
   * @returns Promise with flashcard or null
   */
  findOne(params: FlashcardsFindOneType): Promise<Cards | null>;
  /**
   * Create flashcard
   * @returns Promise with created flashcard
   */
  create(params: FlashcardsCreateType): Promise<Cards>;
  /**
   * Find, filter and count all flashcards
   * @returns Promise witn array of flashcards
   */
  findAndFilterAll(params: FlashcardsFindAllType): Promise<{
    result: Cards[];
    total: number;
  }>;
  /**
   * Create or update records, which bind set and flashcard by ids
   * @returns Promise with void
   */
  upsertCardsOnSets(params: CardsOnSetsUpsertType): Promise<CardsOnSets[]>;
  /**
   * Delete many records, which bind set and flashcard by ids
   * @returns Promise with void
   */
  deleteManyCardsOnSets(params: CardsOnSetsDeleteManyType): Promise<void>;
  /**
   * Flashcards soft deletion
   * @returns Promise with void
   */
  softDelete<T extends string | string[]>(params: {
    id: T;
  }): Promise<SoftDeleteReturnType<T>>;
}
