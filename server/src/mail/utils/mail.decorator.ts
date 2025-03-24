import { applyDecorators } from '@nestjs/common';
import { ApiBody, ApiOperation } from '@nestjs/swagger';
import { ApiResponseExceptionsDocs } from 'src/decorators';
import { SendFormFeedbackDTO, SendQuizFeedbackDTO } from '../dto/mail.dto';

export const ApiFormFeedbackDocs = () =>
  applyDecorators(
    ApiOperation({ summary: 'Send form feedback via email' }),
    ApiBody({
      type: SendFormFeedbackDTO,
      description:
        'Form feedback details, including user feedback, device, OS, app, and network info.',
    }),
    ApiResponseExceptionsDocs(),
  );

export const ApiQuizFeedbackDocs = () =>
  applyDecorators(
    ApiOperation({ summary: 'Send quiz feedback via email' }),
    ApiBody({
      type: SendQuizFeedbackDTO,
      description:
        'Quiz feedback details, including rating and set information.',
    }),
    ApiResponseExceptionsDocs(),
  );
