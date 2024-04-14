import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { SetsController } from './sets.controller';
import { SetsService } from './sets.service';
import { UsersService } from 'src/users';

@Module({
  controllers: [SetsController],
  providers: [SetsService, PrismaService, UsersService],
})
export class SetsModule {}
