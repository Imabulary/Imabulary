import { Module } from '@nestjs/common';
import { TranslatorService } from './translator.service';

@Module({
  providers: [TranslatorService],
  exports: [TranslatorService],
})
export class TranslatorModule {}
