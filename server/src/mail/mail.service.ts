import { Injectable, OnModuleInit } from '@nestjs/common';
import {
  SendSmtpEmail,
  TransactionalEmailsApi,
  TransactionalEmailsApiApiKeys,
} from '@getbrevo/brevo';
import { ConfigService } from '@nestjs/config';
import { SendQuizFeedbackDTO } from './dto/mail.dto';

@Injectable()
export class MailService implements OnModuleInit {
  constructor(private readonly configService: ConfigService) {}

  private readonly brevoClient = new TransactionalEmailsApi();

  onModuleInit() {
    this.brevoClient.setApiKey(
      TransactionalEmailsApiApiKeys.apiKey,
      this.configService.get('BREVO_SMPT_KEY'),
    );
  }

  async sendQuizFeedbackEmail(sendQuizFeedbackDto: SendQuizFeedbackDTO) {
    const smtpClient = new SendSmtpEmail();

    smtpClient.subject = 'You have a new quiz feedback in Imabulary app!';

    await this.brevoClient.sendTransacEmail(smtpClient);

    return true;
  }
}
