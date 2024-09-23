import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateFeedbackDto } from './dto/feedback.dto';

@Injectable()
export class FeedbackService {
  constructor(private readonly prisma: PrismaService) {}

  async getAllFeedbackCategories() {
    return this.prisma.feedbackCategory.findMany();
  }

  async create(feedbackDto: CreateFeedbackDto) {
    const { cardId, text, categories } = feedbackDto;

    const feedback = await this.prisma.feedback.create({
      data: {
        cardId,
        isAppropriate: false,
        text,
        category: {
          connect: categories.map((categoryId) => ({
            id: categoryId,
          })),
        },
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
