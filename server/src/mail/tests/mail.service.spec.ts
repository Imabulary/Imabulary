import { faker } from '@faker-js/faker';
import { CreateSmtpEmail } from '@getbrevo/brevo';
import { ConfigService } from '@nestjs/config';
import { Test, TestingModule } from '@nestjs/testing';
import { Users } from '@prisma/client';
import { IncomingMessage } from 'http';
import { SendFormFeedbackDTO, SendQuizFeedbackDTO } from '../dto/mail.dto';
import { MailService } from '../mail.service';
import { generateFeedbackHtml } from '../utils/helpers';

jest.mock('@getbrevo/brevo'); // Mock the Brevo SDK

describe('MailService', () => {
  const configMockValues = {
    BREVO_API_KEY: faker.string.uuid(),
    TEAM_EMAIL: faker.internet.email(),
    ADMIN_EMAIL: faker.internet.email(),
  };

  let mailService: MailService;
  let configServiceMock: jest.Mocked<ConfigService>;

  beforeEach(async () => {
    configServiceMock = {
      get: jest.fn((key: string) => configMockValues[key] || null),
    } as any;

    const module: TestingModule = await Test.createTestingModule({
      providers: [
        MailService,
        { provide: ConfigService, useValue: configServiceMock },
      ],
    }).compile();

    mailService = module.get<MailService>(MailService);

    // Mock Brevo Client
    const mockBrevoResponse = {
      response: {} as IncomingMessage,
      body: { messageId: faker.string.uuid() } as CreateSmtpEmail,
    };

    jest
      .spyOn(mailService['brevoClient'], 'sendTransacEmail')
      .mockResolvedValue(mockBrevoResponse);

    // Initialize the MailService
    mailService.onModuleInit();
  });

  describe('sendFormFeedbackEmail', () => {
    it('should send form feedback email with correct parameters', async () => {
      const user: Users = {
        id: faker.string.uuid(),
        email: faker.internet.email(),
        externalId: faker.string.uuid(),
      } as Users;

      const feedbackDto: SendFormFeedbackDTO = {
        feedback: 'Great app!',
        deviceType: 'smartphone',
        deviceModel: 'iPhone 14',
        osName: 'iOS',
        osVersion: '17.2',
        appVersion: 'v2.3.4',
        connectionType: 'Wi-Fi',
        screenResolution: '1170x2532',
      };

      const expectedParams = {
        ...feedbackDto,
        userId: user.id,
        userEmail: user.email,
      };

      await expect(
        mailService.sendFormFeedbackEmail(user, feedbackDto),
      ).resolves.toBe(true);

      expect(mailService['brevoClient'].sendTransacEmail).toHaveBeenCalledWith({
        subject: 'You have a new form feedback in Imabulary app!',
        htmlContent: generateFeedbackHtml([
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
        ]),
        params: expectedParams,
        to: [{ email: configMockValues.TEAM_EMAIL, name: 'Team Imabulary' }],
        sender: {
          email: configMockValues.ADMIN_EMAIL,
          name: 'Imabulary Admin',
        },
      });
    });
  });

  describe('sendQuizFeedbackEmail', () => {
    it('should send quiz feedback email with correct parameters', async () => {
      const user: Users = {
        id: faker.string.uuid(),
        email: faker.internet.email(),
        externalId: faker.string.uuid(),
      } as Users;

      const quizFeedbackDto: SendQuizFeedbackDTO = {
        rating: 3,
        setId: faker.string.uuid(),
      };

      const expectedParams = {
        ...quizFeedbackDto,
        firebaseUserId: user.externalId,
        userId: user.id,
      };

      await expect(
        mailService.sendQuizFeedbackEmail(user, quizFeedbackDto),
      ).resolves.toBe(true);

      expect(mailService['brevoClient'].sendTransacEmail).toHaveBeenCalledWith({
        subject: 'You have a new quiz feedback in Imabulary app!',
        htmlContent: generateFeedbackHtml([
          { label: 'Rating', value: 'rating' },
          { label: 'Set ID', value: 'setId' },
          { label: 'Firebase User ID', value: 'firebaseUserId' },
          { label: 'User ID', value: 'userId' },
        ]),
        params: expectedParams,
        to: [{ email: configMockValues.TEAM_EMAIL, name: 'Team Imabulary' }],
        sender: {
          email: configMockValues.ADMIN_EMAIL,
          name: 'Imabulary Admin',
        },
      });
    });
  });
});
