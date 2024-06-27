import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { CashbackService } from './cashback.service';

@Module({
  controllers: [CashbackService],
  providers: [PrismaService, CashbackService],
})
export class CashbackModule {}
