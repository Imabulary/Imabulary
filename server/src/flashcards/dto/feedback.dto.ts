import {
  IsIn,
  IsNotEmpty,
  IsOptional,
  IsString,
  IsUUID,
} from 'class-validator';
import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';
import { EitherCategoryIdOrTextFeedback } from '../../decorators/either-categoryId-or-text.decorator';

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

  @IsRecordExist('feedbackCategories', {
    message: "Feedback category you've provided doesn't exist",
  })
  @IsUUID()
  @IsOptional()
  categoryId?: string;

  @IsString()
  @IsNotEmpty()
  @IsIn(['delete', 'save'], {
    message: 'Action must be either "delete" or "save"',
  })
  action: string;
}
