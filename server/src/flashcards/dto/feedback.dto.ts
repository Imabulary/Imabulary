import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';
import { IsString, IsOptional, IsNotEmpty, IsIn } from 'class-validator';
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

  @IsString()
  @IsOptional()
  categoryId?: string;

  @IsString()
  @IsNotEmpty()
  @IsIn(['delete', 'save'], {
    message: 'Action must be either "delete" or "save"',
  })
  action: string;

  @EitherCategoryIdOrTextFeedback({
    message: 'Either categoryId or text must be provided, but not both',
  })
  validate: boolean;
}
