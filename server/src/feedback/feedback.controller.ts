import { Body, Controller, Get, Post, Req, UseGuards } from '@nestjs/common';
import { FeedbackService } from './feedback.service';
import { AuthGuard } from 'src/guards';
import {
  CreateFeedbackDto,
  CreateNoDesiredObjectFeedbackDTO,
} from './dto/feedback.dto';
import { Users } from '@prisma/client';

@UseGuards(AuthGuard)
@Controller('feedback')
export class FeedbackController {
  constructor(private readonly feedbackService: FeedbackService) {}

  @Get('/categories')
  getFeedbackCategories() {
    return this.feedbackService.getAllFeedbackCategories();
  }

  @Post('/create')
  create(
    @Req() request: Request,
    @Body() createFeedbackDto: CreateFeedbackDto,
  ) {
    const user = request['user'];

    return this.feedbackService.create(createFeedbackDto, user.id);
  }

  @Post('/create/no-desired-object')
  createNoDiseredObjectFeedback(
    @Req() request: Request,
    @Body() createNoDesiredObjectFeedbackDTO: CreateNoDesiredObjectFeedbackDTO,
  ) {
    const user: Users = request['user'];

    return this.feedbackService.createNoDiseredObjectFeedback(
      user.id,
      createNoDesiredObjectFeedbackDTO,
    );
  }
}
