import { Controller, Get, UseGuards } from '@nestjs/common';
import { FeedbackService } from './feedback.service';
import { AuthGuard } from 'src/guards';

@UseGuards(AuthGuard)
@Controller('feedback')
export class FeedbackController {
  constructor(private readonly feedbackService: FeedbackService) {}

  @Get('/feedback')
  getFeedbackCategories() {
    return this.feedbackService.getAllFeedbackCategories();
  }
}
