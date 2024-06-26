import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { DailyAwardsService } from './awards.service';

@Module({
  controllers: [DailyAwardsService],
  providers: [PrismaService, DailyAwardsService],
})
export class WalletModule {}
