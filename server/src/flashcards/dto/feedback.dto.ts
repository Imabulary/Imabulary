import { IsOptional, IsString } from 'class-validator';
import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';

export class LikeFlashcardDto {
  @IsString({ message: 'UID must be a valid string' })
  @IsRecordExist('cards', {
    each: false,
    message: 'Flashcard is unavailable for feedback',
  })
  cardId: string;
}

export class DislikeFlashcardDto extends LikeFlashcardDto {
  @IsString()
  @IsOptional()
  text?: string;

  @IsRecordExist('feedbackCategories', { each: true })
  @IsString({ each: true })
  @IsOptional()
  categories?: string[];
}
