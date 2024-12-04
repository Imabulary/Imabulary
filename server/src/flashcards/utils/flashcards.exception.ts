import { HttpException, HttpStatus } from '@nestjs/common';

type FlashcardNotFoundExceptionType = {
  flashcardId?: string;
  incidentMethod: string;
  plural?: boolean;
};

type FlashcardRegeneratedExceptionType = {
  flashcardId: string;
};

type FlashcardWithFeedbackExceptionType = {
  flashcardId: string;
  feedbackId: string;
};

export class FlashcardNotFoundException extends HttpException {
  constructor({
    flashcardId,
    incidentMethod,
    plural = false,
  }: FlashcardNotFoundExceptionType) {
    super(
      plural
        ? "We couldn't find the flashcards you've requested. Make sure they exist and aren't deleted."
        : "We couldn't find the flashcard you've requested. Make sure it exists and isn't deleted.",
      HttpStatus.NOT_FOUND,
      {
        cause: { ...(plural && { flashcardId }), incidentMethod },
      },
    );
  }
}

export class FlashcardRegeneratedException extends HttpException {
  constructor({ flashcardId }: FlashcardRegeneratedExceptionType) {
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
  constructor({ flashcardId, feedbackId }: FlashcardWithFeedbackExceptionType) {
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
