import { Inject, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { CustomPrismaService } from 'nestjs-prisma';
import { type ExtendedPrismaClient } from '../prisma';
import { CreateUserDTO } from './dto/user.dto';

@Injectable()
export class UsersService {
  constructor(
    @Inject('PrismaService')
    private readonly prisma: CustomPrismaService<ExtendedPrismaClient>,
  ) {}

  /**
   * This method uses extended PrismaService, which creates a wallet with a cashback and award for it
   * every time `create` function of `users` model is triggered.
   *
   * Check `server/src/prisma/prisma.extension.ts:3` for implementation details
   */
  async create(createUserDto: CreateUserDTO) {
    const { uid, email } = createUserDto;

    const user = await this.findOne({ externalId: uid, email });

    return (
      user ||
      this.prisma.client.users.create({ data: { externalId: uid, email } })
    );
  }

  async findOne(where: Prisma.UsersWhereUniqueInput) {
    return this.prisma.client.users.findFirst({ where });
  }
}
