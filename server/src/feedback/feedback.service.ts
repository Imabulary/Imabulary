import { Injectable, Logger } from '@nestjs/common';
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
  private readonly logger = new Logger(FeedbackService.name);
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
      this.logger.warn(
        "No desired object on image feedback category wasn't found",
        { slug: feedbackCategoriesSlugs.NO_DESIRED_OBJECT },
      );

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

  async update(id: string, data: Prisma.FeedbackUpdateInput) {
    return await this.prisma.feedback.update({
      where: {
        id,
      },
      data,
    });
  }

  async updateMany(
    where: Prisma.FeedbackWhereInput,
    data:
      | Prisma.FeedbackUpdateManyMutationInput
      | Prisma.FeedbackUncheckedUpdateManyInput,
  ) {
    return await this.prisma.feedback.updateMany({
      where,
      data,
    });
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
        category: !isEmpty(categories)
          ? {
              connect: categories.map((categoryId) => ({
                id: categoryId,
              })),
            }
          : undefined,
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
