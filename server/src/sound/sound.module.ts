import { Module } from '@nestjs/common';
import { SoundService } from './sound.service';

@Module({
  providers: [SoundService],
  controllers: [SoundService],
})
export class SoundModule {}
