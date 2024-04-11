import { Module } from '@nestjs/common';
import { SetsService } from './sets.service';
import { SetsController } from './sets.controller';
import { PrismaService } from 'src/prisma';
import { AppService } from 'src/app.service';
import { StorageService } from 'src/storage/storage.service';
import { VisionService } from 'src/vision/vision.service';
import { AssistantService } from 'src/assistant/assistant.service';
import { TranslatorService } from 'src/translator/translator.service';
import { UsersService } from 'src/users';

@Module({
  controllers: [SetsController],
  providers: [
    SetsService,
    PrismaService,
    AppService,
    StorageService,
    VisionService,
    AssistantService,
    TranslatorService,
    UsersService,
  ],
})
export class SetsModule {}
