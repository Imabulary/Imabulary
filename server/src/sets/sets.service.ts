import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { CreateSetDto, UpdateSetDto } from './dto/set.dto';
import { Prisma } from '@prisma/client';
import { PrismaService } from '../prisma';
import { SET_NOT_FOUND_ERROR_MESSAGE } from './utils';

@Injectable()
export class SetsService {
  constructor(private readonly prisma: PrismaService) {}

  async create(userId: string, createSetDto: CreateSetDto) {
    const { name, description } = createSetDto;

    await this.throwIfSetExists(userId, name);

    return this.prisma.sets.create({ data: { userId, name, description } });
  }

  async findOne(where: Prisma.SetsWhereInput) {
    const set = await this.prisma.sets.findFirst({ where });

    if (!set) {
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

  remove(id: string, userId: string) {
    return this.prisma.sets.delete({ where: { id, userId } });
  }

  private async throwIfSetExists(userId: string, name: string) {
    const set = await this.findOne({ userId, name });

    if (set) {
      throw new BadRequestException(
        `Set with the name "${name}" already exists`,
      );
    }
  }
}
