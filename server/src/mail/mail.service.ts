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

    smtpClient.htmlContent = `
      <html>
        <body>
          <b>Rating</b>
          <span>{{params.rating}}</span>
          <br>
          <b>Set ID</b>
          <span>{{params.setId}}</span>
          <br>
          <b>Firebase User ID</b>
          <span>{{params.firebaseUserId}}</span>
        </body>
      </html>
    `;

    smtpClient.to = [
      {
        email: this.configService.get('TEAM_EMAIL'),
        name: 'Team Imabulary',
      },
    ];

    smtpClient.params = sendQuizFeedbackDto;

    await this.brevoClient.sendTransacEmail(smtpClient);

    return true;
  }
}
