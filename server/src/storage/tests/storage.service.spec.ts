import { Test, TestingModule } from '@nestjs/testing';
import { StorageService } from '../storage.service';
import admin from 'firebase-admin';
import {
  ForbiddenException,
  InternalServerErrorException,
  UnauthorizedException,
} from '@nestjs/common';
import {
  FORBIDDEN_ERROR,
  IBucketFolders,
  UNAUTHORIZED_ERROR,
  UNKNOWN_ERROR,
} from '../utils';

jest.mock('firebase-admin');

jest.mock('firebase-admin/storage', () => ({
  getDownloadURL: jest
    .fn()
    .mockResolvedValue('https://remarkable-hackwork.info'),
}));

describe('StorageService', () => {
  let service: StorageService;

  const mockAdminSdk = (code?: string, error?: string) => {
    admin.storage = jest.fn().mockReturnValue({
      bucket: jest.fn().mockReturnValue({
        file: jest.fn().mockReturnValue({
          save:
            code || error
              ? jest.fn().mockImplementation(() => {
                  if (error) {
                    throw { error };
                  }

                  throw { code };
                })
              : jest.fn(),
        }),
      }),
    });
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [StorageService],
    }).compile();

    service = module.get<StorageService>(StorageService);
  });

  it('return the URL of uploaded image', async () => {
    mockAdminSdk();

    const imageUrl = await service.upload(
      IBucketFolders.IMAGE,
      'image.png',
      Buffer.from('image content'),
    );

    expect(imageUrl).toBe('https://remarkable-hackwork.info');
  });

  it('should throw unknown error in case it was thrown by the SDK', async () => {
    mockAdminSdk('storage/unknown');

    expect(async () => {
      await service.upload(
        IBucketFolders.IMAGE,
        'image.png',
        Buffer.from('image content'),
      );
    }).rejects.toThrow(new InternalServerErrorException(UNKNOWN_ERROR));
  });

  it('should throw UnauthorizedException in case client tried to perform the operation being unauthenticated', async () => {
    mockAdminSdk('storage/unauthenticated');

    expect(async () => {
      await service.upload(
        IBucketFolders.IMAGE,
        'image.png',
        Buffer.from('image content'),
      );
    }).rejects.toThrow(new UnauthorizedException(UNAUTHORIZED_ERROR));
  });

  it('should throw ForbiddenException in case client tried to perform the operation violating rules', async () => {
    mockAdminSdk('storage/unauthorized');

    expect(async () => {
      await service.upload(
        IBucketFolders.IMAGE,
        'image.png',
        Buffer.from('image content'),
      );
    }).rejects.toThrow(new ForbiddenException(FORBIDDEN_ERROR));
  });

  it('should throw InternalServerErrorException in case we are not handling error thrown by the SDK', async () => {
    mockAdminSdk('storage/quota-exceeded');

    expect(async () => {
      await service.upload(
        IBucketFolders.IMAGE,
        'image.png',
        Buffer.from('image content'),
      );
    }).rejects.toThrow(new InternalServerErrorException(UNKNOWN_ERROR));
  });

  it('should throw InternalServerErrorException in case the error happened but it is not the SDK error', async () => {
    mockAdminSdk(
      null,
      'Unexpected error happened, probably something is wrong with the code',
    );

    expect(async () => {
      await service.upload(
        IBucketFolders.IMAGE,
        'image.png',
        Buffer.from('image content'),
      );
    }).rejects.toThrow(new InternalServerErrorException(UNKNOWN_ERROR));
  });
});
