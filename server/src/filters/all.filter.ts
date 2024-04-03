import { ArgumentsHost, Catch, HttpException, Logger } from '@nestjs/common';
import { BaseExceptionFilter } from '@nestjs/core';
import { Request, Response } from 'express';
import { getMaybe } from 'src/utils';

@Catch()
export class AllExceptionsFilter extends BaseExceptionFilter {
  private readonly logger = new Logger(AllExceptionsFilter.name);

  catch(exception: unknown, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const request = ctx.getRequest<Request>();
    const response = ctx.getResponse<Response>();

    if (exception instanceof HttpException) {
      const error = {
        timestamp: new Date().toISOString(),
        path: request.url,
        statusCode: exception.getStatus(),
        cause: exception.cause,
        error: exception.message,
        message: getMaybe('message', exception.getResponse())
          .map((message) => (Array.isArray(message) ? message[0] : message))
          .unwrapOr(undefined),
      };

      this.logger.error(error);

      return response.status(error.statusCode).json({
        statusCode: error.statusCode,
        error: error.error,
        message: error.message ?? error.error,
      });
    }

    // TODO: send errors to external logging system
    this.logger.error(exception);
    super.catch(exception, host);
  }
}
