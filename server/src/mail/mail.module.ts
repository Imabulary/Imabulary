import { Module } from '@nestjs/common';
import { MailService } from './mail.service';
import { MailController } from './mail.controller';
import { ConfigService } from '@nestjs/config';

@Module({
  controllers: [MailController],
  providers: [MailService, ConfigService],
})
export class MailModule {}
