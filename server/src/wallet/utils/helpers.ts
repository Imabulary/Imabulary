import { Wallet } from '@prisma/client';
import { NotFoundException, BadRequestException } from '@nestjs/common';
import {
  WALLET_NOT_FOUND,
  TECHNICAL_ISSUE,
  WALLET_STATUS,
  WALLET_IS_INACTIVE,
} from './constants';

export function validateWallet(wallet: Wallet) {
  if (!wallet) {
    throw new NotFoundException(WALLET_NOT_FOUND);
  }

  if (typeof wallet.balance !== 'number') {
    throw new BadRequestException(TECHNICAL_ISSUE);
  }

  if (wallet.status === WALLET_STATUS.INACTIVE) {
    throw new BadRequestException(WALLET_IS_INACTIVE);
  }
}

export function checkBalanceAvailability(balance: number, cost: number) {
  return balance >= cost;
}

export function conduct(balance: number, cost: number) {
  return balance + cost;
}

export function deduct(balance: number, cost: number) {
  return balance - cost;
}
