import { Module } from '@nestjs/common';
import { CustomPrismaModule } from 'nestjs-prisma';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { WalletModule } from 'src/wallet/wallet.module';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';
import { StorageService } from 'src/storage/storage.service';

@Module({
  controllers: [UsersController],
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
    WalletModule,
  ],
  providers: [UsersService, PrismaService, StorageService],
})
export class UsersModule {}
