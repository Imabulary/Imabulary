import { Module } from '@nestjs/common';
import { MulterModule } from '@nestjs/platform-express';
import { memoryStorage } from 'multer';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { PrismaService } from './prisma/prisma.service';

@Module({
  imports: [
    MulterModule.register({
      storage: memoryStorage(),
    }),
    ConfigModule.forRoot(),
  ],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}
