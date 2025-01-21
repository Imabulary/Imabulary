import { HttpException, HttpStatus } from '@nestjs/common';
import { INSUFFICIENT_FUNDS_ERROR } from './constants';

export class InsufficientFundsException extends HttpException {
  constructor(cost: number, balance: number) {
    super(INSUFFICIENT_FUNDS_ERROR, HttpStatus.BAD_REQUEST, {
      cause: { cost, balance },
    });
  }
}
