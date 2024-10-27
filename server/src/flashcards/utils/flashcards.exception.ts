import { HttpException, HttpStatus } from '@nestjs/common';

export class FlashcardNotFoundException extends HttpException {
  constructor(id: string, incidentMethod: string) {
    super(
      'Flashcard with the provided ID has not been found',
      HttpStatus.NOT_FOUND,
      {
        cause: { id, incidentMethod },
      },
    );
  }
}

export class FlashcardRegeneratedException extends HttpException {
  constructor(id: string) {
    super(
      'Flashcard with the provided ID has already been regenerated',
      HttpStatus.BAD_REQUEST,
      {
        cause: { id, incidentMethod: 'FlashCardsService.regenerate' },
      },
    );
  }
}

export class FlashcardWithFeedbackException extends HttpException {
  constructor(id: string, feedbackId: string) {
    super(
      'You have already provided a feedback for this flashcard',
      HttpStatus.BAD_REQUEST,
      {
        cause: { id, feedbackId, incidentMethod: 'FlashCardsService.dislike' },
      },
    );
  }
}
