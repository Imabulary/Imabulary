import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';
import { IsString } from 'class-validator';

export class CardDto {
  @IsString({ message: 'UID must be a valid string' })
  @IsRecordExist('cards', {
    each: false,
    message: 'Flashcard is unavailable for regeneration',
  })
  cardId: string;
}
