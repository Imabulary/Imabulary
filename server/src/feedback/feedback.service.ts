import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import {
  CreateFeedbackDto,
  CreateNoDesiredObjectFeedbackDTO,
} from './dto/feedback.dto';
import { Prisma } from '@prisma/client';
import { feedbackCategoriesSlugs } from './utils/constants';

@Injectable()
export class FeedbackService {
  constructor(private readonly prisma: PrismaService) {}

  async getAllFeedbackCategories() {
    return this.prisma.feedbackCategory.findMany();
  }

  async createNoDiseredObjectFeedback(
    userId: string,
    createNoDesiredObjectFeedbackDTO: CreateNoDesiredObjectFeedbackDTO,
  ) {
    const noDesiredObjectFeedbackCategory = await this.findOneFeedbackCategory({
      slug: feedbackCategoriesSlugs.NO_DESIRED_OBJECT,
    });

    await this.create(
      { categories: [noDesiredObjectFeedbackCategory.id] },
      userId,
      createNoDesiredObjectFeedbackDTO,
    );

    return true;
  }

  async create(
    createFeedbackDto: CreateFeedbackDto,
    userId: string,
    metadata?: object,
  ) {
    const { isAppropriate, categories, ...feedbackDto } = createFeedbackDto;

    return this.prisma.feedback.create({
      data: {
        ...feedbackDto,
        isAppropriate: isAppropriate || false,
        metadata,
        userId,
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

  private findOneFeedbackCategory(
    where: Prisma.FeedbackCategoryWhereUniqueInput,
  ) {
    return this.prisma.feedbackCategory.findUnique({ where });
  }
}
