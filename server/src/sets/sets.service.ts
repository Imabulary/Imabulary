import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { CreateSetDto, UpdateSetDto } from './dto/set.dto';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma';
import { SET_NOT_FOUND_ERROR_MESSAGE } from './utils';
import { ServerPagination } from 'src/shared';

@Injectable()
export class SetsService {
  constructor(private readonly prisma: PrismaService) {}

  async create(userId: string, createSetDto: CreateSetDto) {
    const { name, description } = createSetDto;

    await this.throwIfSetExists(userId, name);

    return this.prisma.sets.create({ data: { userId, name, description } });
  }

  async findAll(userId: string, pagination: ServerPagination) {
    const [sets, total] = await this.prisma.$transaction([
      this.prisma.sets.findMany({
        ...pagination,
        orderBy: { createdAt: 'desc' },
        where: { userId },
        include: {
          CardsOnSets: {
            include: {
              flashcard: {
                select: {
                  image_url: true,
                  QuizStatus: true,
                },
              },
            },
          },
        },
      }),
      this.prisma.sets.count({ where: { userId } }),
    ]);

    const result = sets.map((set) => ({
      ...set,
      CardsOnSets: undefined,
      flashcards: set.CardsOnSets.map((cardsOnSets) => cardsOnSets.flashcard),
    }));

    return {
      result,
      total,
    };
  }

  async findOne(where: Prisma.SetsWhereInput, throwWhenSetIsNull = true) {
    const set = await this.prisma.sets.findFirst({
      where,
      include: { flashcards: true },
    });

    if (!set && throwWhenSetIsNull) {
      throw new NotFoundException(SET_NOT_FOUND_ERROR_MESSAGE, {
        cause: `Provided condition: ${JSON.stringify(where, null, 2)}`,
      });
    }

    return set;
  }

  async update(id: string, userId: string, updateSetDto: UpdateSetDto) {
    const { name, description } = updateSetDto;

    if (name) {
      await this.throwIfSetExists(userId, name);
    }

    return this.prisma.sets.update({
      where: { id, userId },
      data: { name, description },
    });
  }

  async remove(id: string, userId: string) {
    await this.prisma.cardsOnSets.deleteMany({ where: { setId: id } });

    return this.prisma.sets.delete({ where: { id, userId } });
  }

  private async throwIfSetExists(userId: string, name: string) {
    const set = await this.findOne({ userId, name }, false);

    if (set) {
      throw new BadRequestException(
        `Set with the name "${name}" already exists`,
      );
    }
  }
}
