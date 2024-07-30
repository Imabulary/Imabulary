import { IsString, IsNotEmpty } from 'class-validator';

export class TextToSpeechDto {
  @IsString()
  @IsNotEmpty()
  text: string;
}
