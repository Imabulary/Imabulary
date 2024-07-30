import { Inject, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { CustomPrismaService } from 'nestjs-prisma';
import { type ExtendedPrismaClient } from '../prisma';
import { CreateUserDTO } from './dto/user.dto';
import { WalletService } from 'src/wallet/wallet.service';

@Injectable()
export class UsersService {
  constructor(
    @Inject('PrismaService')
    private readonly prisma: CustomPrismaService<ExtendedPrismaClient>,
    private readonly wallet: WalletService,
  ) {}

  /**
   * This method uses extended PrismaService, which creates a wallet with a cashback and award for it
   * every time `create` function of `users` model is triggered.
   *
   * Check `server/src/prisma/prisma.extension.ts:3` for implementation details
   */
  async create(createUserDto: CreateUserDTO) {
    const { uid, email } = createUserDto;

    let user = await this.findOne({ externalId: uid, email });

    if (!user) {
      user = await this.prisma.client.users.create({
        data: { externalId: uid, email },
      });
    }

    const wallet = await this.wallet.findOneAndValidate(user.id, {
      Awards: true,
    });

    return { user, award: wallet.Awards };
  }

  async findOne(where: Prisma.UsersWhereUniqueInput) {
    return this.prisma.client.users.findFirst({
      where,
    });
  }
}
