import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class FeedbackService {
  constructor(private readonly prisma: PrismaService) {}

  async getAllFeedbackCategories() {
    return this.prisma.feedbackCategory.findMany();
  }

  async leaveFeedback(feedbackDto: {
    cardId: string;
    text: string;
    categoryId: string;
  }) {
    const { cardId, text, categoryId } = feedbackDto;

    const feedback = await this.prisma.feedback.create({
      data: {
        cardId,
        isAppropriate: false,
        text,
        categoryId,
      },
      include: {
        card: {
          include: {
            user: {
              include: {
                Wallet: true,
              },
            },
          },
        },
      },
    });

    return feedback;
  }
}
