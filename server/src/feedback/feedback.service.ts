import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { isEmpty } from 'lodash';
import { PrismaService } from '../prisma/prisma.service';
import {
  CreateFeedbackDto,
  CreateNoDesiredObjectFeedbackDTO,
} from './dto/feedback.dto';
import { feedbackCategoriesSlugs } from './utils/constants';
import { FeedbackCategoriesMisconfigurationException } from './utils/feedback.exception';

@Injectable()
export class FeedbackService {
  constructor(private readonly prisma: PrismaService) {}

  // TODO: add tests
  async getAllFeedbackCategories() {
    const categories = await this.prisma.feedbackCategory.findMany({
      where: {
        slug: { not: { equals: feedbackCategoriesSlugs.NO_DESIRED_OBJECT } },
      },
    });

    if (isEmpty(categories)) {
      throw new FeedbackCategoriesMisconfigurationException();
    }

    return categories;
  }

  async createNoDiseredObjectFeedback(
    userId: string,
    createNoDesiredObjectFeedbackDTO: CreateNoDesiredObjectFeedbackDTO,
  ) {
    const noDesiredObjectFeedbackCategory = await this.findOneFeedbackCategory({
      slug: feedbackCategoriesSlugs.NO_DESIRED_OBJECT,
    });

    if (!noDesiredObjectFeedbackCategory) {
      // TODO: add log indicating that category wasn't found
      await this.create({}, userId, createNoDesiredObjectFeedbackDTO);
    } else {
      await this.create(
        { categories: [noDesiredObjectFeedbackCategory.id] },
        userId,
        createNoDesiredObjectFeedbackDTO,
      );
    }

    return true;
  }

  async create(
    createFeedbackDto: CreateFeedbackDto,
    userId: string,
    metadata?: object,
  ) {
    const { categories, ...feedbackDto } = createFeedbackDto;

    return this.prisma.feedback.create({
      data: {
        ...feedbackDto,
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

  findOne(where: Prisma.FeedbackWhereInput) {
    return this.prisma.feedback.findFirst({ where });
  }

  private findOneFeedbackCategory(
    where: Prisma.FeedbackCategoryWhereUniqueInput,
  ) {
    return this.prisma.feedbackCategory.findUnique({ where });
  }
}
