import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { ProductsController } from './products.controller';
import { ProductsService } from './products.service';
import { ProductsRepository } from './products.repository';

@Module({
  controllers: [ProductsController],
  providers: [ProductsService, PrismaService, ProductsRepository],
})
export class ProductsModule {}
