import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { WalletController } from './wallet.controller';
import { WalletService } from './wallet.service';
import { UsersService } from 'src/users';

@Module({
  controllers: [WalletController],
  providers: [PrismaService, WalletService, UsersService],
})
export class WalletModule {}
