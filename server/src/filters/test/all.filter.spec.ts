import { ArgumentsHost, HttpException, Logger } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { Test, TestingModule } from '@nestjs/testing';
import { AllExceptionsFilter } from '../all.filter';
import { Response, Request } from 'express';

describe('AllExceptionsFilter', () => {
  let filter: AllExceptionsFilter;
  let mockResponse: Partial<Response>;
  let mockRequest: Partial<Request>;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AllExceptionsFilter],
    }).compile();

    filter = module.get<AllExceptionsFilter>(AllExceptionsFilter);

    mockRequest = { url: '/test', method: 'PATCH' };
    mockResponse = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
      headersSent: false,
    };

    jest.spyOn(Logger.prototype, 'error').mockImplementation(jest.fn());
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('should handle HttpException', () => {
    const exception = new HttpException('Forbidden', 403);
    const host = createMockArgumentsHost(mockRequest, mockResponse);

    filter.catch(exception, host);

    expect(mockResponse.status).toHaveBeenCalledWith(403);
    expect(mockResponse.json).toHaveBeenCalledWith({
      statusCode: 403,
      error: 'Forbidden',
      message: 'Forbidden',
    });
  });

  it('should handle PrismaClientKnownRequestError with not found code', () => {
    const exception = new Prisma.PrismaClientKnownRequestError(
      'Record not found',
      {
        code: 'P2025',
        clientVersion: '1.0.0',
      },
    );
    const host = createMockArgumentsHost(mockRequest, mockResponse);

    filter.catch(exception, host);

    expect(mockResponse.status).toHaveBeenCalledWith(404);
    expect(mockResponse.json).toHaveBeenCalledWith({
      statusCode: 404,
      message:
        "It looks like we don't have such a record, so we won't be able to update it",
    });
  });

  it('should handle PrismaClientKnownRequestError with other codes', () => {
    const exception = new Prisma.PrismaClientKnownRequestError(
      'Internal server error',
      {
        code: 'P2000',
        clientVersion: '1.0.0',
      },
    );
    const host = createMockArgumentsHost(mockRequest, mockResponse);

    filter.catch(exception, host);

    expect(mockResponse.status).toHaveBeenCalledWith(500);
    expect(mockResponse.json).toHaveBeenCalledWith({
      statusCode: 500,
      message: 'Internal server error',
    });
  });

  function createMockArgumentsHost(
    req: Partial<Request>,
    res: Partial<Response>,
  ): ArgumentsHost {
    return {
      switchToHttp: () => ({
        getRequest: () => req,
        getResponse: () => res,
      }),
      getArgs: () => [req, res, null],
      getArgByIndex: (index: number) => [req, res, null][index],
    } as unknown as ArgumentsHost;
  }
});
