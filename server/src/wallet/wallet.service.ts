import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { add, subtract } from 'lodash';
import { PrismaService } from '../prisma';
import {
  checkBalanceAvailability,
  DEFAULT_USER_BALANCE,
  validateWallet,
} from './utils';
import { InsufficientFundsException } from './utils/wallet.exception';
import { WalletRepository } from './wallet.repository';

@Injectable()
export class WalletService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly walletRepository: WalletRepository,
  ) {}

  create(userId: string) {
    return this.prisma.wallet.create({
      data: { userId, balance: DEFAULT_USER_BALANCE },
    });
  }

  findOne(
    where: Prisma.WalletWhereUniqueInput,
    include?: Prisma.WalletInclude,
  ) {
    return this.walletRepository.findOne({ where, include });
  }

  async findOneAndValidate(userId: string, include?: Prisma.WalletInclude) {
    const wallet = await this.findOne({ userId }, include);

    validateWallet(wallet);

    return wallet;
  }

  async manage(userId: string, cost: number, operation: 'add' | 'subtract') {
    const operations = { add, subtract };

    await this.prisma.$transaction(async (prisma) => {
      const wallet = await prisma.wallet.findUnique({
        where: { userId },
      });

      validateWallet(wallet);

      if (
        operation === 'subtract' &&
        !checkBalanceAvailability(wallet.balance, cost)
      ) {
        throw new InsufficientFundsException(cost, wallet.balance);
      }

      await prisma.wallet.update({
        where: { userId },
        data: { balance: operations[operation](wallet.balance, cost) },
      });
    });
  }
}
