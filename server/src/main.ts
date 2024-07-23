import { ConfigService } from '@nestjs/config';
import { HttpAdapterHost, NestFactory } from '@nestjs/core';
import admin, { ServiceAccount } from 'firebase-admin';
import * as serviceAccount from '../service-account.json';
import { AppModule } from './app.module';
import { AllExceptionsFilter } from './filters';
import { ValidationPipe } from '@nestjs/common';
import { ResponseInterceptor } from './interceptors';
import { setupSwagger } from 'openapi/swagger.config';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });

  const configService = app.get(ConfigService);
  const { httpAdapter } = app.get(HttpAdapterHost);

  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount as ServiceAccount),
    storageBucket: configService.get<string>('STORAGE_URL'),
  });

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
