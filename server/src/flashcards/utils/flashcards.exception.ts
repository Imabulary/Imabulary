import { HttpException, HttpStatus } from '@nestjs/common';
import { Prisma } from '@prisma/client';

export class FlashcardNotFoundException extends HttpException {
  constructor(where: Prisma.CardsWhereUniqueInput) {
    super(
      "We couldn't find the flashcard you've requested. Make sure it exists and isn't deleted.",
      HttpStatus.NOT_FOUND,
      {
        cause: { where },
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
