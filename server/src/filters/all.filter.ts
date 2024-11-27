import { ArgumentsHost, Catch, HttpException, Logger } from '@nestjs/common';
import { BaseExceptionFilter } from '@nestjs/core';
import { Prisma } from '@prisma/client';
import { Request, Response } from 'express';
import { getMaybe } from 'src/utils';

@Catch()
export class AllExceptionsFilter extends BaseExceptionFilter {
  private readonly logger = new Logger(AllExceptionsFilter.name);
  private request: Request;
  private response: Response;

  catch(exception: unknown, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    this.request = ctx.getRequest<Request>();
    this.response = ctx.getResponse<Response>();

    if (exception instanceof HttpException) {
      return this.handleHttpException(exception);
    }

    if (exception instanceof Prisma.PrismaClientKnownRequestError) {
      return this.handlePrismaException(exception);
    }

    this.logger.error(exception);
    super.catch(exception, host);
  }

  private get baseError() {
    return {
      timestamp: new Date().toISOString(),
      path: this.request.url,
    };
  }

  private handleHttpException(exception: HttpException) {
    const error = {
      ...this.baseError,
      statusCode: exception.getStatus(),
      cause: exception.cause,
      error: exception.message,
      message: getMaybe('message', exception.getResponse())
        .map((message) => (Array.isArray(message) ? message[0] : message))
        .unwrapOr(undefined),
    };

    this.logger.error(error);

    return this.response.status(error.statusCode).json({
      statusCode: error.statusCode,
      error: error.error,
      message: error.message ?? error.error,
    });
  }

  private handlePrismaException(
    exception: Prisma.PrismaClientKnownRequestError,
  ) {
    const prismaCode = exception.code;
    // Code that prisma will throw if it won't be able to find a record in DB
    const prismaNotFoundCode = 'P2025';

    const statusCode = prismaCode === prismaNotFoundCode ? 404 : 500;

    const errorMessages = {
      'P2025/PATCH':
        "It looks like we don't have such a record, so we won't be able to update it",
      'P2025/DELETE':
        "It looks like we don't have such a record, so we won't be able to delete it",
    };

    const message =
      errorMessages[`${prismaCode}/${this.request.method}`] ||
      'Internal server error';

    const error = {
      ...this.baseError,
      statusCode,
      message,
      error: exception.message,
      meta: exception.meta,
    };

    this.logger.error(error);

    return this.response.status(statusCode).json({
      statusCode,
      message,
    });
  }
}
