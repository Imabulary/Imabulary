import { Controller, Post, Body, Res } from '@nestjs/common';
import { TextToSpeechService } from './text-to-speech.service';
import { Response } from 'express';

@Controller('text-to-speech')
export class TextToSpeechController {
  constructor(private readonly textToSpeechService: TextToSpeechService) {}

  @Post('synthesize')
  async synthesizeSpeech(
    @Body('text') text: string,
    @Res() res: Response,
  ): Promise<void> {
    const base64Audio = await this.textToSpeechService.synthesizeSpeech(text);
    const audioBuffer = Buffer.from(base64Audio, 'base64');

    res.setHeader('Content-Type', 'audio/mpeg');
    res.setHeader('Content-Length', audioBuffer.length.toString());

    res.end(audioBuffer);
  }
}
