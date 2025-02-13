import { Module } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { StorageService } from 'src/storage/storage.service';
import { UsersService } from 'src/users';
import { WalletService } from 'src/wallet/wallet.service';
import { MailController } from './mail.controller';
import { MailService } from './mail.service';

@Module({
  controllers: [MailController],
  providers: [
    MailService,
    ConfigService,
    UsersService,
    PrismaService,
    StorageService,
    FeedbackService,
    WalletService,
  ],
})
export class MailModule {}
