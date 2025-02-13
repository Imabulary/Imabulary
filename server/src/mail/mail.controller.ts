import { Body, Controller, Post, Req, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { Users } from '@prisma/client';
import { Request } from 'express';
import { AuthGuard } from 'src/guards';
import { SendFormFeedbackDTO, SendQuizFeedbackDTO } from './dto/mail.dto';
import { MailService } from './mail.service';
import {
  ApiFormFeedbackDocs,
  ApiQuizFeedbackDocs,
} from './utils/mail.decorator';

@ApiTags('Mail')
@ApiBearerAuth()
@UseGuards(AuthGuard)
@Controller('mail')
export class MailController {
  constructor(private readonly mailService: MailService) {}

  @Post('feedback/form')
  @ApiFormFeedbackDocs()
  sendFormFeedbackEmail(
    @Req() request: Request,
    @Body() sendFormFeedbackDto: SendFormFeedbackDTO,
  ) {
    const user: Users = request['user'];

    return this.mailService.sendFormFeedbackEmail(user, sendFormFeedbackDto);
  }

  @Post('feedback/quiz')
  @ApiQuizFeedbackDocs()
  sendQuizFeedbackEmail(
    @Req() request: Request,
    @Body() sendQuizFeedbackDto: SendQuizFeedbackDTO,
  ) {
    const user: Users = request['user'];

    return this.mailService.sendQuizFeedbackEmail(user, sendQuizFeedbackDto);
  }
}
