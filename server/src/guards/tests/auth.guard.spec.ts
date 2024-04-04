import { ExecutionContext } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import admin from 'firebase-admin';
import { PrismaService } from '../../prisma';
import { UsersService } from '../../users';
import { AuthGuard } from '../auth.guard';
import {
  UNAUTHORIZED_ERROR_MESSAGE,
  UNDEFINED_TOKEN_ERROR_MESSAGE,
  UNDEFINED_USER_ERROR_MESSAGE,
} from '../utils';
import { faker } from '@faker-js/faker';

jest.mock('firebase-admin');

describe('AuthGuard', () => {
  let authGuard: AuthGuard;
  let users: UsersService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AuthGuard, UsersService, PrismaService],
    }).compile();

    authGuard = module.get<AuthGuard>(AuthGuard);
    users = module.get<UsersService>(UsersService);
  });

  const mockContext = (withData?: boolean) => {
    return {
      switchToHttp: () => ({
        getRequest: jest.fn().mockReturnValue({}),
      }),
      getArgs: jest
        .fn()
        .mockReturnValue(
          withData
            ? [{ headers: { authorization: 'Bearer !token$123%' } }]
            : [],
        ),
    } as unknown as ExecutionContext;
  };

  const mockVerifyToken = (uid?: string) => {
    admin.auth = jest.fn().mockReturnValue({
      verifyIdToken: uid
        ? jest.fn().mockResolvedValue({ uid })
        : jest.fn().mockRejectedValue(new Error('Invalid token')),
    });
  };

  it('should throw UnauthorizedException in case token was not provided in header', () => {
    const context = mockContext();

    authGuard.canActivate(context).catch((error) => {
      expect(error.message).toBe(UNAUTHORIZED_ERROR_MESSAGE);
      expect(error.cause.message).toBe(UNDEFINED_TOKEN_ERROR_MESSAGE);
    });
  });

  it('should throw UnauthorizedException in case token firebase admin verification went wrong', () => {
    const context = mockContext(true);

    mockVerifyToken();

    authGuard.canActivate(context).catch((error) => {
      expect(error.message).toBe(UNAUTHORIZED_ERROR_MESSAGE);
      expect(error.cause.message).toBe('Invalid token');
    });
  });

  it('should throw an UnauthorizedException if the user with the UID extracted from the token does not exist in the database', () => {
    const context = mockContext(true);

    const externalId = faker.string.uuid();

    mockVerifyToken(externalId);

    users.findOne = jest.fn().mockResolvedValue(null);

    authGuard.canActivate(context).catch((error) => {
      expect(error.message).toBe(UNAUTHORIZED_ERROR_MESSAGE);
      expect(error.cause.message).toBe(
        UNDEFINED_USER_ERROR_MESSAGE.replace(':externalId', externalId),
      );
    });
  });

  it('should return true indicating that user is authrorized', async () => {
    const context = mockContext(true);

    const externalId = faker.string.uuid();

    mockVerifyToken(externalId);

    users.findOne = jest
      .fn()
      .mockResolvedValue({ email: faker.internet.email() });

    const result = await authGuard.canActivate(context);

    expect(result).toBe(true);
  });
});
