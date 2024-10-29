import { HttpException, HttpStatus } from '@nestjs/common';

export class FlashcardNotFoundException extends HttpException {
  constructor(flashcardId: string, incidentMethod: string) {
    super(
      "We couldn't find the flashcard you've requested. Make sure it exists and isn't deleted.",
      HttpStatus.NOT_FOUND,
      {
        cause: { flashcardId, incidentMethod },
      },
    );
  }
}

export class FlashcardRegeneratedException extends HttpException {
  constructor(flashcardId: string) {
    super(
      'You have already regenerated this flashcard',
      HttpStatus.BAD_REQUEST,
      {
        cause: { flashcardId, incidentMethod: 'FlashCardsService.regenerate' },
      },
    );
  }
}

export class FlashcardWithFeedbackException extends HttpException {
  constructor(flashcardId: string, feedbackId: string) {
    super(
      'You have already provided a feedback for this flashcard',
      HttpStatus.BAD_REQUEST,
      {
        cause: {
          flashcardId,
          feedbackId,
          incidentMethod: 'FlashCardsService.dislike',
        },
      },
    );
  }
}
