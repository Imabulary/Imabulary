import { faker } from '@faker-js/faker';
import { ExecutionContext } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import { FlashcardGuard } from '../flashcard.guard';
import { UNDEFINED_USER_ERROR_MESSAGE } from '../utils';
import { WalletService } from 'src/wallet';
import { INSUFFICIENT_FUNDS_ERROR } from 'src/wallet/utils';
import { FLASHCARD_DEFAULT_COST } from 'src/shared/constants';
import { PrismaService } from 'src/prisma';
import { WalletRepository } from 'src/wallet/wallet.repository';

describe('FlashcardGuard', () => {
  let flashcardGuard: FlashcardGuard;
  let wallet: WalletService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        FlashcardGuard,
        WalletService,
        PrismaService,
        WalletRepository,
      ],
    }).compile();

    flashcardGuard = module.get<FlashcardGuard>(FlashcardGuard);
    wallet = module.get<WalletService>(WalletService);
  });

  const mockContext = (withUser?: boolean) => {
    return {
      switchToHttp: () => ({
        getRequest: jest.fn().mockReturnValue({
          user: withUser ? { id: faker.string.uuid() } : undefined,
        }),
      }),
    } as unknown as ExecutionContext;
  };

  it('should throw UnauthorizedException in case user is not authorized during coins balance validation', () => {
    const context = mockContext();

    flashcardGuard.canActivate(context).catch((error) => {
      expect(error.message).toBe(UNDEFINED_USER_ERROR_MESSAGE);
      expect(error.cause).toEqual({ request: { user: undefined } });
    });
  });

  it('should throw InsufficientFundsException in case user does not have enough coins to create a flashcard', () => {
    const context = mockContext(true);

    wallet.findOneAndValidate = jest.fn().mockResolvedValue({ balance: 0 });

    flashcardGuard.canActivate(context).catch((error) => {
      expect(error.message).toBe(INSUFFICIENT_FUNDS_ERROR);
      expect(error.cause.balance).toEqual(0);
      expect(error.cause.cost).toEqual(FLASHCARD_DEFAULT_COST);
    });
  });

  it('should return true in case user has enough coins to create a flashcard', async () => {
    const context = mockContext(true);

    wallet.findOneAndValidate = jest.fn().mockResolvedValue({ balance: 5 });

    const result = await flashcardGuard.canActivate(context);

    expect(result).toBe(true);
  });
});
