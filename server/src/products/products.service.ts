import { Injectable } from '@nestjs/common';
import { ProductsRepository } from './products.repository';
import { Prisma } from '@prisma/client';
import { ProductMisconfigurationException } from './utils';

@Injectable()
export class ProductsService {
  constructor(private readonly productsRepository: ProductsRepository) {}

  async findAll() {
    return this.productsRepository.findAll();
  }

  async findOne(where: Prisma.ProductsWhereInput) {
    const product = await this.productsRepository.findOne(where);

    if (!product) {
      throw new ProductMisconfigurationException(where);
    }

    return product;
  }
}
