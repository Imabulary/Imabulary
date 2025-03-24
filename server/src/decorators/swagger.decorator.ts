import { applyDecorators } from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiInternalServerErrorResponse,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';

const getErrorSchema = (statusCode: number, message: string) => {
  const errorMessages = new Map([
    [400, 'Bad Request'],
    [401, 'Unauthorized'],
    [500, 'Internal Server Error'],
  ]);

  return {
    schema: {
      example: {
        statusCode,
        error: errorMessages.get(statusCode) || 'Unknown Error',
        message,
      },
    },
  };
};

export const ApiResponseExceptionsDocs = () =>
  applyDecorators(
    ApiBadRequestResponse({
      description: 'Validation failed. Check the request body.',
      ...getErrorSchema(400, 'Validation error: feedback is required'),
    }),
    ApiUnauthorizedResponse({
      description: 'Unauthorized request. User authentication required.',
      ...getErrorSchema(401, 'Authentication token is missing or invalid'),
    }),
    ApiInternalServerErrorResponse({
      description: 'Internal server error.',
      ...getErrorSchema(500, 'Unexpected error occurred while sending email'),
    }),
  );
