import { Body, Controller, Post, UseGuards } from '@nestjs/common';
import { MailService } from './mail.service';
import { AuthGuard } from 'src/guards';
import { SendQuizFeedbackDTO } from './dto/mail.dto';

@UseGuards(AuthGuard)
@Controller('mail')
export class MailController {
  constructor(private readonly mailService: MailService) {}

  @Post('feedback/form')
  sendFormFeedbackEmail() {
    // TODO: implement
  }

  @Post('feedback/quiz')
  sendQuizFeedbackEmail(@Body() sendQuizFeedbackDto: SendQuizFeedbackDTO) {
    return this.mailService.sendQuizFeedbackEmail(sendQuizFeedbackDto);
  }
}
