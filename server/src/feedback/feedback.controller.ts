import { Body, Controller, Get, Post, UseGuards } from '@nestjs/common';
import { FeedbackService } from './feedback.service';
import { AuthGuard } from 'src/guards';
import { CreateFeedbackDto } from './dto/feedback.dto';

@UseGuards(AuthGuard)
@Controller('feedback')
export class FeedbackController {
  constructor(private readonly feedbackService: FeedbackService) {}

  @Get('/categories')
  getFeedbackCategories() {
    return this.feedbackService.getAllFeedbackCategories();
  }

  @Post('/create')
  create(@Body() createFeedbackDto: CreateFeedbackDto) {
    return this.feedbackService.create(createFeedbackDto);
  }
}
