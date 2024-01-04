import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import admin, { ServiceAccount } from 'firebase-admin';
import * as serviceAccount from '../service-account.json';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });

  const configService = app.get(ConfigService);

  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount as ServiceAccount),
    storageBucket: configService.get<string>('STORAGE_URL'),
  });

  const PORT = configService.get<string>('PORT') || 5000;

  await app.listen(PORT);
}
bootstrap();
