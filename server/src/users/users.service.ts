import { Injectable } from '@nestjs/common';
import { CreateUserDTO } from './dto/user.dto';
import { PrismaService } from '../prisma';
import { Prisma } from '@prisma/client';

@Injectable()
export class UsersService {
  constructor(private readonly prisma: PrismaService) {}

  async create(createUserDto: CreateUserDTO) {
    const { uid, email } = createUserDto;

    const user = await this.findOne({ externalId: uid, email });

    return (
      user || this.prisma.users.create({ data: { externalId: uid, email } })
    );
  }

  async findOne(where: Prisma.UsersWhereUniqueInput) {
    return this.prisma.users.findFirst({ where });
  }
}
