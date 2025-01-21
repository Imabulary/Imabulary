import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma';

@Injectable()
export class ProductsRepository {
  constructor(private readonly prisma: PrismaService) {}

  findAll() {
    return this.prisma.products.findMany();
  }

  findOne(where: Prisma.ProductsWhereInput) {
    return this.prisma.products.findFirst({ where });
  }
}
