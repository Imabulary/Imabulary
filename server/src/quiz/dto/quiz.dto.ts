import { IsString } from 'class-validator';
import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';

export class QuizDTO {
  @IsString({ message: 'UID must be a valid string' })
  @IsRecordExist(
    { entity: 'cards' },
    {
      each: false,
      message: 'Flashcard is unavailable for quiz',
    },
  )
  cardId: string;

  @IsString({ message: 'Word should be provided' })
  word: string;
}
