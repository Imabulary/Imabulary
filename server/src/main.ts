import { ConfigService } from '@nestjs/config';
import { HttpAdapterHost, NestFactory } from '@nestjs/core';
import admin, { ServiceAccount } from 'firebase-admin';
import * as serviceAccount from '../service-account.json';
import { AppModule } from './app.module';
import { AllExceptionsFilter } from './filters';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });

  const configService = app.get(ConfigService);
  const { httpAdapter } = app.get(HttpAdapterHost);

  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount as ServiceAccount),
    storageBucket: configService.get<string>('STORAGE_URL'),
  });

  app.useGlobalFilters(new AllExceptionsFilter(httpAdapter));

  const PORT = configService.get<string>('PORT') || 5000;

  await app.listen(PORT);
}
bootstrap();
