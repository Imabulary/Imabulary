import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma';

@Injectable()
export class QuizService {
  constructor(private readonly prisma: PrismaService) {}

  private findStatusId = (array: Record<string, string>[], statusName) => {
    return array.find((item) => statusName === item.name)?.id;
  };

  async saveResult(cardId: string, word: string) {
    const card = await this.prisma.cards.findUnique({
      where: {
        id: cardId,
      },
    });

    if (!card) {
      throw new BadRequestException(
        'Card not found or you do not have access to it.',
      );
    }

    const isCorrect = card.word.toLowerCase() === word.toLowerCase();

    const quizStatuses = await this.prisma.quizCardStatus.findMany();

    try {
      return await this.prisma.cards.update({
        where: {
          id: cardId,
        },
        data: {
          quizStatusId: isCorrect
            ? this.findStatusId(quizStatuses, 'mastered')
            : this.findStatusId(quizStatuses, 'still_learing'),
          updatedAt: new Date(),
        },
      });
    } catch (error) {
      throw new BadRequestException('Quiz status assign error: ' + error);
    }
  }
}
