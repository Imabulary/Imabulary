import { Injectable, OnModuleInit } from '@nestjs/common';
import { TextToSpeechClient, protos } from '@google-cloud/text-to-speech';
import * as adminAccount from '../../admin-account.json';

@Injectable()
export class TextToSpeechService implements OnModuleInit {
  private client: TextToSpeechClient;

  onModuleInit() {
    this.client = new TextToSpeechClient({
      credentials: adminAccount,
    });
  }

  async synthesizeSpeech(text: string): Promise<string> {
    const request = {
      input: { text },
      voice: {
        languageCode: 'en-US',
        ssmlGender: protos.google.cloud.texttospeech.v1.SsmlVoiceGender.NEUTRAL,
      },
      audioConfig: {
        audioEncoding: protos.google.cloud.texttospeech.v1.AudioEncoding.MP3,
      },
    };

    const [response] = await this.client.synthesizeSpeech(request);
    const audioContent = response.audioContent as Uint8Array;
    return Buffer.from(audioContent).toString('base64');
  }
}
