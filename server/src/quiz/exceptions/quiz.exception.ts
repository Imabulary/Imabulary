import { HttpException, HttpStatus } from '@nestjs/common';
import { QUIZ_STATUS } from '../utils/quiz-status';

export class QuizStatusMisconfigurationException extends HttpException {
  constructor(status: QUIZ_STATUS) {
    super(
      'Quiz statuses misconfiguration. This is a server fault and our developers are already on it, try again later.',
      HttpStatus.INTERNAL_SERVER_ERROR,
      {
        cause: status,
        description:
          'Please verify that "quizCardStatus" dictionary table have been correctly seeded with the data',
      },
    );
  }
}
