import { Controller, Get, UseGuards } from '@nestjs/common';
import { FeedbackService } from './feedback.service';
import { AuthGuard } from 'src/guards';

@UseGuards(AuthGuard)
@Controller('feedback')
export class FeedbackController {
  constructor(private readonly feedbackService: FeedbackService) {}

  @Get('/categories')
  getFeedbackCategories() {
    return this.feedbackService.getAllFeedbackCategories();
  }
}
