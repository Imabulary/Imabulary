import { Module } from '@nestjs/common';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { SetsController } from './sets.controller';
import { SetsService } from './sets.service';
import { UsersService } from 'src/users';
import { CustomPrismaModule } from 'nestjs-prisma';

@Module({
  controllers: [SetsController],
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
  ],
  providers: [SetsService, PrismaService, UsersService],
})
export class SetsModule {}
