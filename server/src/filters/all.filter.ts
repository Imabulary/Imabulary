import { ArgumentsHost, Catch, HttpException, Logger } from '@nestjs/common';
import { BaseExceptionFilter } from '@nestjs/core';
import { Request } from 'express';
import { assign } from 'lodash/fp';

@Catch()
export class AllExceptionsFilter extends BaseExceptionFilter {
  private readonly logger = new Logger(AllExceptionsFilter.name);

  catch(exception: unknown, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const request = ctx.getRequest<Request>();

    const errorFoundation = {
      timestamp: new Date().toISOString(),
      path: request.url,
    };

    const error =
      exception instanceof HttpException
        ? assign(errorFoundation, {
            statusCode: exception.getStatus(),
            cause: exception.cause,
            message: exception.message,
          })
        : exception;

    // TODO: send errors to external logging system
    this.logger.error(error);
    super.catch(exception, host);
  }
}
