import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { QuizDTO } from './dto/quiz.dto';
import { QUIZ_STATUS } from './utils/quiz-status';
import { QuizStatusMisconfigurationException } from './exceptions/quiz.exception';

@Injectable()
export class QuizService {
  constructor(private readonly prisma: PrismaService) {}

  async learn(quizDto: QuizDTO) {
    const card = await this.prisma.cards.findUnique({
      where: {
        id: quizDto.cardId,
      },
    });

    if (!card) {
      throw new BadRequestException(
        'Card not found or you do not have access to it.',
      );
    }

    const isCorrect = card.word.toLowerCase() === quizDto.word.toLowerCase();

    const [stillLearningQuizStatus, masteredQuizStatus] = await Promise.all([
      this.findStillLearningQuizStatus(),
      this.findMasteredQuizStatus(),
    ]);

    return await this.prisma.cards.update({
      where: {
        id: quizDto.cardId,
      },
      data: {
        quizStatusId: isCorrect
          ? masteredQuizStatus.id
          : stillLearningQuizStatus.id,
        updatedAt: new Date(),
      },
    });
  }

  async findNotStudiedQuizStatus() {
    const status = await this.prisma.quizCardStatus.findFirst({
      where: { name: QUIZ_STATUS.NOT_STUDIED },
    });

    if (!status) {
      throw new QuizStatusMisconfigurationException(QUIZ_STATUS.NOT_STUDIED);
    }

    return status;
  }

  async findStillLearningQuizStatus() {
    const status = await this.prisma.quizCardStatus.findFirst({
      where: { name: QUIZ_STATUS.STILL_LEARNING },
    });

    if (!status) {
      throw new QuizStatusMisconfigurationException(QUIZ_STATUS.STILL_LEARNING);
    }

    return status;
  }

  async findMasteredQuizStatus() {
    const status = await this.prisma.quizCardStatus.findFirst({
      where: { name: QUIZ_STATUS.MASTERED },
    });

    if (!status) {
      throw new QuizStatusMisconfigurationException(QUIZ_STATUS.MASTERED);
    }

    return status;
  }
}
