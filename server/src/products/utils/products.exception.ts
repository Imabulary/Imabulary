import { HttpException, HttpStatus } from '@nestjs/common';
import { Prisma } from '@prisma/client';

export class ProductMisconfigurationException extends HttpException {
  constructor(where: Prisma.ProductsWhereInput) {
    super(
      'Products or subscriptions misconfiguration. This is a server fault and our developers are already on it, try again later.',
      HttpStatus.INTERNAL_SERVER_ERROR,
      {
        cause: { where },
        description:
          'Please verify that "products" table has been correctly seeded with the data',
      },
    );
  }
}
