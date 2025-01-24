import { HttpException, HttpStatus } from '@nestjs/common';
import { Prisma } from '@prisma/client';

export class UserNotFoundException extends HttpException {
  constructor(where: Prisma.UsersWhereInput) {
    super('User was not found', HttpStatus.NOT_FOUND, {
      cause: { where },
    });
  }
}
