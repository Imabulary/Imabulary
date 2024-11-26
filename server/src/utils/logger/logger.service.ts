import { ConsoleLogger } from '@nestjs/common';
import { captureException, captureMessage } from '@sentry/nestjs';
import { isString } from 'lodash';

export class LoggerService extends ConsoleLogger {
  error(message: any, stack?: string, context?: string) {
    captureException(message, {
      tags: { appEnvironment: process.env.NODE_ENV },
      extra: { stack, context },
    });

    super.error(stack ? `${message}\n${stack}` : message, context);
  }

  warn(message: unknown, context?: unknown): void {
    if (isString(message)) {
      captureMessage(message, { level: 'warning', extra: { context } });
    }

    super.log(message, context);
  }
}
