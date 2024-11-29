import { BadRequestException, NotFoundException } from '@nestjs/common';
import { Wallet } from '@prisma/client';
import {
  WALLET_IS_INACTIVE,
  WALLET_NOT_FOUND,
  WALLET_STATUS,
} from './constants';

export function validateWallet(wallet: Wallet) {
  if (!wallet) {
    throw new NotFoundException(WALLET_NOT_FOUND);
  }

  if (wallet.status === WALLET_STATUS.INACTIVE) {
    throw new BadRequestException(WALLET_IS_INACTIVE);
  }
}

export function checkBalanceAvailability(balance: number, cost: number) {
  return balance >= cost;
}
