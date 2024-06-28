import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { WalletController } from './wallet.controller';
import { WalletService } from './wallet.service';
import { UsersService } from 'src/users';
import { DailyAwardsService } from 'src/awards/awards.service';

@Module({
  controllers: [WalletController],
  providers: [PrismaService, WalletService, UsersService, DailyAwardsService],
})
export class WalletModule {}
