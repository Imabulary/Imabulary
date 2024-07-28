import { Module } from '@nestjs/common';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { WalletController } from './wallet.controller';
import { WalletService } from './wallet.service';
import { UsersService } from 'src/users';
import { DailyAwardsService } from 'src/awards/awards.service';
import { CustomPrismaModule } from 'nestjs-prisma';

@Module({
  controllers: [WalletController],
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
  ],
  providers: [PrismaService, WalletService, UsersService, DailyAwardsService],
})
export class WalletModule {}
