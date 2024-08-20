import { Body, Controller, Post, UseGuards } from '@nestjs/common';
import { AuthGuard } from 'src/guards';
import { QuizService } from './quiz.service';
import { QuizDto } from './dto/quiz.dto';

@UseGuards(AuthGuard)
@Controller('quiz')
export class QuizController {
  constructor(private readonly quizService: QuizService) {}

  @Post('learn')
  learnCard(@Body() asnwerDto: QuizDto) {
    return this.quizService.saveResult(asnwerDto.cardId, asnwerDto.word);
  }
}
