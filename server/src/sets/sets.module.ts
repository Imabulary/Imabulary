import { Module } from '@nestjs/common';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { SetsController } from './sets.controller';
import { SetsService } from './sets.service';
import { UsersService } from 'src/users';
import { CustomPrismaModule } from 'nestjs-prisma';
import { WalletModule } from 'src/wallet/wallet.module';

@Module({
  controllers: [SetsController],
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
    WalletModule,
  ],
  providers: [SetsService, PrismaService, UsersService],
})
export class SetsModule {}
