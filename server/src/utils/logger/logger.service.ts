import { ConsoleLogger, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { captureException, captureMessage } from '@sentry/nestjs';
import { isString } from 'lodash';

@Injectable()
export class LoggerService extends ConsoleLogger {
  constructor(private readonly configService: ConfigService) {
    super();
  }

  error(message: any, stack?: string, context?: string) {
    const env = this.configService.get('NODE_ENV');

    if (env !== 'development') {
      captureException(message, {
        extra: { stack, context },
      });
    }

    super.error(stack ? `${message}\n${stack}` : message, context);
  }

  warn(message: unknown, context?: unknown): void {
    const env = this.configService.get('NODE_ENV');

    if (env !== 'development') {
      if (isString(message)) {
        captureMessage(message, { level: 'warning', extra: { context } });
      }
    }

    super.log(message, context);
  }
}
