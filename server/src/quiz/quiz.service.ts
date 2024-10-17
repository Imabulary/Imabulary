import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { QuizDTO } from './dto/quiz.dto';
import { QUIZ_STATUS } from './utils/quiz-status';

@Injectable()
export class QuizService {
  constructor(private readonly prisma: PrismaService) {}

  // findAllStatuses() {

  // }

  private findStatusId(array: { id: string; name: string }[], statusName) {
    return array.find((item) => statusName === item.name)?.id;
  }

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

    const quizStatuses = await this.prisma.quizCardStatus.findMany();

    return await this.prisma.cards.update({
      where: {
        id: quizDto.cardId,
      },
      data: {
        quizStatusId: isCorrect
          ? this.findStatusId(quizStatuses, QUIZ_STATUS.MASTERED)
          : this.findStatusId(quizStatuses, QUIZ_STATUS.STILL_LEARNING),
        updatedAt: new Date(),
      },
    });
  }
}
