import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma';

@Injectable()
export class WalletRepository {
  constructor(private readonly prisma: PrismaService) {}

  findOne(args: Pick<Prisma.WalletFindFirstArgs, 'where' | 'include'>) {
    return this.prisma.wallet.findFirst(args);
  }
}
