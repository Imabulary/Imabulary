import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateFeedbackDto } from './dto/feedback.dto';

@Injectable()
export class FeedbackService {
  constructor(private readonly prisma: PrismaService) {}

  async getAllFeedbackCategories() {
    return this.prisma.feedbackCategory.findMany();
  }

  async create(createFeedbackDto: CreateFeedbackDto) {
    const { categories, ...feedbackDto } = createFeedbackDto;

    return this.prisma.feedback.create({
      data: {
        ...feedbackDto,
        isAppropriate: false,
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
  }
}
