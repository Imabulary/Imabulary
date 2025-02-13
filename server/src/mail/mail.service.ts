import {
  SendSmtpEmailSender,
  SendSmtpEmailToInner,
  TransactionalEmailsApi,
  TransactionalEmailsApiApiKeys,
} from '@getbrevo/brevo';
import { Injectable, OnModuleInit } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Users } from '@prisma/client';
import { SendFormFeedbackDTO, SendQuizFeedbackDTO } from './dto/mail.dto';
import { generateFeedbackHtml } from './utils/helpers';

@Injectable()
export class MailService implements OnModuleInit {
  constructor(private readonly configService: ConfigService) {}

  private readonly brevoClient = new TransactionalEmailsApi();

  private to: SendSmtpEmailToInner[];
  private sender: SendSmtpEmailSender;

  onModuleInit() {
    const brevoApiKey = this.configService.get<string>('BREVO_API_KEY');

    this.brevoClient.setApiKey(
      TransactionalEmailsApiApiKeys.apiKey,
      brevoApiKey,
    );

    this.to = [
      {
        email: this.configService.get('TEAM_EMAIL'),
        name: 'Team Imabulary',
      },
    ];

    this.sender = {
      email: this.configService.get('ADMIN_EMAIL'),
      name: 'Imabulary Admin',
    };
  }

  async sendFormFeedbackEmail(
    user: Users,
    sendFormFeedbackDto: SendFormFeedbackDTO,
  ) {
    const fields = [
      { label: 'Feedback', value: 'feedback' },
      { label: 'Device type', value: 'deviceType' },
      { label: 'Device model', value: 'deviceModel' },
      { label: 'OS name', value: 'osName' },
      { label: 'OS version', value: 'osVersion' },
      { label: 'App version', value: 'appVersion' },
      { label: 'Connection type', value: 'connectionType' },
      { label: 'Screen resolution', value: 'screenResolution' },
      { label: 'User ID', value: 'userId' },
      { label: 'Email', value: 'userEmail' },
    ];

    await this.brevoClient.sendTransacEmail({
      subject: 'You have a new form feedback in Imabulary app!',
      htmlContent: generateFeedbackHtml(fields),
      params: {
        ...sendFormFeedbackDto,
        userId: user.id,
        userEmail: user.email,
      },
      to: this.to,
      sender: this.sender,
    });

    return true;
  }

  async sendQuizFeedbackEmail(
    user: Users,
    sendQuizFeedbackDto: SendQuizFeedbackDTO,
  ) {
    const fields = [
      { label: 'Rating', value: 'rating' },
      { label: 'Set ID', value: 'setId' },
      { label: 'Firebase User ID', value: 'firebaseUserId' },
      { label: 'User ID', value: 'userId' },
    ];

    await this.brevoClient.sendTransacEmail({
      subject: 'You have a new quiz feedback in Imabulary app!',
      htmlContent: generateFeedbackHtml(fields),
      params: {
        ...sendQuizFeedbackDto,
        firebaseUserId: user.externalId,
        userId: user.id,
      },
      to: this.to,
      sender: this.sender,
    });

    return true;
  }
}
