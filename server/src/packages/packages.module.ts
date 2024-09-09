import { Module } from '@nestjs/common';
import { PackagesService } from './packages.service';
import { PackagesController } from './packages.controller';
import { extendedPrismaClient, PrismaService } from 'src/prisma';
import { UsersService } from 'src/users';
import { CustomPrismaModule } from 'nestjs-prisma';

@Module({
  controllers: [PackagesController],
  imports: [
    CustomPrismaModule.forRootAsync({
      name: 'PrismaService',
      useFactory: () => extendedPrismaClient,
    }),
  ],
  providers: [PackagesService, PrismaService, UsersService],
})
export class PackagesModule {}
