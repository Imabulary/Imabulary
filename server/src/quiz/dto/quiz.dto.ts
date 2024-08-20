import { IsString } from 'class-validator';
import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';

export class QuizDto {
  @IsString({ message: 'UID must be a valid string' })
  @IsRecordExist('cards', {
    each: false,
    message: 'Flashcard is unavailable for feedback',
  })
  cardId: string;

  @IsString({ message: 'Word should be provided' })
  word: string;
}
