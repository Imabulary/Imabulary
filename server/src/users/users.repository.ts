import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma';

@Injectable()
export class UsersRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findOne(args: Prisma.UsersFindFirstArgs) {
    return this.prisma.users.findFirst({
      ...args,
      include: args.include,
    });
  }
}
