import { HttpException, HttpStatus } from '@nestjs/common';

export class FeedbackCategoriesMisconfigurationException extends HttpException {
  constructor(category?: string) {
    super(
      'Feedback categories misconfiguration. This is a server fault and our developers are already on it, try again later.',
      HttpStatus.INTERNAL_SERVER_ERROR,
      {
        cause: category,
        description:
          'Please verify that "feedbackCategories" dictionary table has been correctly seeded with the data',
      },
    );
  }
}
