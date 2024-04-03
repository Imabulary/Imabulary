import { Injectable } from '@nestjs/common';
import { CreateUserDTO } from './dto/user.dto';
import { PrismaService } from '../prisma';

@Injectable()
export class UsersService {
  constructor(private readonly prisma: PrismaService) {}

  async create(createUserDto: CreateUserDTO) {
    const { uid, email } = createUserDto;

    const user = await this.prisma.users.findFirst({
      where: { externalId: uid, email },
    });

    return (
      user || this.prisma.users.create({ data: { externalId: uid, email } })
    );
  }
}
