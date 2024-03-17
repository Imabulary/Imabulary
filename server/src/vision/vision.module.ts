import { Module } from '@nestjs/common';
import { VisionService } from './vision.service';

@Module({
  providers: [VisionService],
})
export class VisionModule {}
