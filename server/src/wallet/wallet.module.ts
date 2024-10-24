import { Module } from '@nestjs/common';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { WalletController } from './wallet.controller';
import { WalletService } from './wallet.service';
import { UsersService } from 'src/users';
import { DailyAwardsService } from 'src/awards/awards.service';
import { CustomPrismaModule } from 'nestjs-prisma';
import { StorageModule } from 'src/storage/storage.module';
import { FeedbackModule } from 'src/feedback/feedback.module';
import { FeedbackService } from 'src/feedback/feedback.service';
@Module({
  controllers: [WalletController],
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
    StorageModule,
  ],
  providers: [
    PrismaService,
    FeedbackService,
    WalletService,
    UsersService,
    DailyAwardsService,
  ],
  exports: [WalletService],
})
export class WalletModule {}
