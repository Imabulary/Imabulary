import { BadRequestException, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { add, subtract } from 'lodash';
import { PrismaService } from '../prisma';
import {
  checkBalanceAvailability,
  DEFAULT_USER_BALANCE,
  INSUFFICIENT_FUNDS,
  validateWallet,
} from './utils';

@Injectable()
export class WalletService {
  constructor(private readonly prisma: PrismaService) {}

  create(userId: string) {
    return this.prisma.wallet.create({
      data: { userId, balance: DEFAULT_USER_BALANCE },
    });
  }

  findOne(
    where: Prisma.WalletWhereUniqueInput,
    include?: Prisma.WalletInclude,
  ) {
    return this.prisma.wallet.findFirst({ where, include });
  }

  async findOneAndValidate(userId: string, include?: Prisma.WalletInclude) {
    const wallet = await this.findOne({ userId }, include);

    validateWallet(wallet);

    return wallet;
  }

  async manage(userId: string, cost: number, operation: 'add' | 'subtract') {
    const operaions = { add, subtract };

    await this.prisma.$transaction(async (prisma) => {
      const wallet = await prisma.wallet.findUnique({
        where: { userId },
      });

      validateWallet(wallet);

      if (
        operation === 'subtract' &&
        !checkBalanceAvailability(wallet.balance, cost)
      ) {
        throw new BadRequestException(INSUFFICIENT_FUNDS);
      }

      await prisma.wallet.update({
        where: { userId },
        data: { balance: operaions[operation](wallet.balance, cost) },
      });
    });
  }
}
