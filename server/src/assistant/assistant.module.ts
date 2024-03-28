import { Module } from '@nestjs/common';
import { AssistantService } from './assistant.service';

@Module({
  providers: [AssistantService],
  exports: [AssistantService],
})
export class AssistantModule {}
