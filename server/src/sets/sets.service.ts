import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma';
import { CreateSetDto, SetsFilters, UpdateSetDto } from './dto/set.dto';
import { SET_NOT_FOUND_ERROR_MESSAGE, SetsFindAllArgs } from './utils';
import { fromNullable } from '@sweet-monads/maybe';
import { identity, isNil } from 'lodash';

@Injectable()
export class SetsService {
  constructor(private readonly prisma: PrismaService) {}

  async create(userId: string, createSetDto: CreateSetDto) {
    const { name, description } = createSetDto;

    await this.throwIfSetExists(userId, name);

    return this.prisma.sets.create({ data: { userId, name, description } });
  }

  async findAll(userId: string, { pagination, filters }: SetsFindAllArgs) {
    // NOTE: potentially to be moved to something like FiltersPipe
    const setsFilters = fromNullable(filters)
      .map<SetsFilters>(identity)
      .unwrapOr({});

    const where = {
      userId,
      ...(!isNil(setsFilters.isFinished) && {
        isFinished: setsFilters.isFinished,
      }),
    };

    const [sets, total] = await this.prisma.$transaction([
      this.prisma.sets.findMany({
        ...pagination,
        orderBy: { createdAt: 'desc' },
        where,
        include: {
          CardsOnSets: {
            include: {
              flashcard: {
                select: {
                  image_url: true,
                  quizStatusId: true,
                },
              },
            },
          },
        },
      }),
      this.prisma.sets.count({ where }),
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
    const { name, ...data } = updateSetDto;

    if (name) {
      await this.throwIfSetExists(userId, name);
    }

    return this.prisma.sets.update({
      where: { id, userId },
      data: { name, ...data },
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
