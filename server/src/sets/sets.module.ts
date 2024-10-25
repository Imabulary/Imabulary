import { Module } from '@nestjs/common';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { SetsController } from './sets.controller';
import { SetsService } from './sets.service';
import { UsersService } from 'src/users';
import { CustomPrismaModule } from 'nestjs-prisma';
import { WalletModule } from 'src/wallet/wallet.module';
import { StorageModule } from 'src/storage/storage.module';
import { FeedbackService } from 'src/feedback/feedback.service';

@Module({
  controllers: [SetsController],
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
    WalletModule,
    StorageModule,
  ],
  providers: [SetsService, PrismaService, UsersService, FeedbackService],
})
export class SetsModule {}
