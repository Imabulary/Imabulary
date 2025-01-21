import { ConsoleLogger, OnModuleInit } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { captureException, captureMessage } from '@sentry/nestjs';
import { isString } from 'lodash';

export class LoggerService extends ConsoleLogger implements OnModuleInit {
  private isDevelopmentEnvironment: boolean;

  onModuleInit() {
    const configService = new ConfigService();
    const environment = configService.get<string>('NODE_ENV');

    this.isDevelopmentEnvironment = environment === 'development';
  }

  error(message: any, stack?: string, context?: string) {
    if (!this.isDevelopmentEnvironment) {
      captureException(message, {
        extra: { stack, context },
      });
    }

    super.error(stack ? `${message}\n${stack}` : message, context);
  }

  warn(message: unknown, context?: unknown): void {
    if (isString(message) && !this.isDevelopmentEnvironment) {
      captureMessage(message, { level: 'warning', extra: { context } });
    }

    super.log(message, context);
  }
}
