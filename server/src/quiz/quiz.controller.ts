import { Body, Controller, Get, Post, UseGuards } from '@nestjs/common';
import { AuthGuard } from 'src/guards';
import { QuizService } from './quiz.service';
import { QuizDTO } from './dto/quiz.dto';

@UseGuards(AuthGuard)
@Controller('quiz')
export class QuizController {
  constructor(private readonly quizService: QuizService) {}

  @Post('learn')
  learn(@Body() quizDto: QuizDTO) {
    return this.quizService.learn(quizDto);
  }

  @Get('statuses')
  findAllStatuses() {
    return this.quizService.findAllStatuses();
  }
}
