import {
  Controller,
  Post,
  Body,
  Res,
  UseGuards,
  StreamableFile,
} from '@nestjs/common';
import { AuthGuard } from 'src/guards';
import { TextToSpeechService } from './text-to-speech.service';
import type { Response } from 'express';
import { PassThrough } from 'stream';
import { TextToSpeechDto } from './dto/text-to-speech.dto';

@UseGuards(AuthGuard)
@Controller('text-to-speech')
export class TextToSpeechController {
  constructor(private readonly textToSpeechService: TextToSpeechService) {}

  @Post('synthesize')
  async synthesizeSpeech(
    @Body() textToSpeechDto: TextToSpeechDto,
    @Res({ passthrough: true }) res: Response,
  ): Promise<StreamableFile> {
    const base64Audio = await this.textToSpeechService.synthesizeSpeech(
      textToSpeechDto.text,
    );
    const audioBuffer = Buffer.from(base64Audio, 'base64');

    res.set({
      'Content-Type': 'audio/mpeg',
      'Content-Length': audioBuffer.length,
    });

    const stream = new PassThrough();
    stream.end(audioBuffer);

    return new StreamableFile(stream);
  }
}
