import { Controller, Post, Body } from '@nestjs/common';
import { TextToSpeechService } from './text-to-speech.service';

@Controller('tts')
export class TextToSpeechController {
  constructor(private readonly textToSpeechService: TextToSpeechService) {}

  @Post('synthesize')
  async synthesizeSpeech(
    @Body('text') text: string,
  ): Promise<{ audioContent: string }> {
    const audioContent = await this.textToSpeechService.synthesizeSpeech(text);
    return { audioContent };
  }
}
