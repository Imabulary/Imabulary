import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma';

@Injectable()
export class QuizService {
  constructor(private readonly prisma: PrismaService) {}

  async saveResult(cardId: string, word: string) {
    const card = await this.prisma.cards.findUnique({
      where: {
        id: cardId,
      },
    });

    if (!card) {
      throw new Error('Card not found or you do not have access to it.');
    }

    const isCorrect = card.word.toLowerCase() === word.toLowerCase();

    const updatedCard = await this.prisma.cards.update({
      where: {
        id: cardId,
      },
      data: {
        quizStatusName: isCorrect ? 'mastered' : 'still_learning',
        updatedAt: new Date(),
      },
    });

    return updatedCard;
  }
}
