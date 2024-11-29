import './instruments'; //! NOTE - IT'S VERY IMPORTANT TO KEEP THIS IMPORT ON TOP OF OTHERS
import { ValidationPipe } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { HttpAdapterHost, NestFactory } from '@nestjs/core';
import admin, { ServiceAccount } from 'firebase-admin';
import { setupSwagger } from 'openapi/swagger.config';
import * as serviceAccount from '../service-account.json';
import { AppModule } from './app.module';
import { AllExceptionsFilter } from './filters';
import { ResponseInterceptor } from './interceptors';
import { LoggerService } from './utils/logger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, {
    cors: true,
    bufferLogs: true,
  });

  const configService = app.get(ConfigService);
  const { httpAdapter } = app.get(HttpAdapterHost);

  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount as ServiceAccount),
    storageBucket: configService.get<string>('STORAGE_URL'),
  });

  app.useLogger(app.get(LoggerService));
  app.useGlobalFilters(new AllExceptionsFilter(httpAdapter));
  app.useGlobalPipes(new ValidationPipe({ stopAtFirstError: true }));
  app.useGlobalInterceptors(new ResponseInterceptor());

  const PORT = configService.get<string>('PORT') || 5000;

  if (configService.get<string>('NODE_ENV') === 'development') {
    setupSwagger(app);
  }

  await app.listen(PORT);
}
bootstrap();
