import { IsArray, IsOptional, IsString, IsUUID } from 'class-validator';
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

  @IsArray()
  @IsString({ each: true })
  @IsOptional()
  categories?: string[];
}

export class CreateFeedbackDto {
  @IsUUID(4, { message: 'Card ID must be a valid UUID string' })
  @IsOptional()
  cardId?: string;

  @IsString({ message: 'Text of the feedback must be a string' })
  @IsOptional()
  text?: string;

  @IsUUID(4, {
    each: true,
    message: 'All categories must be valid UUID strings',
  })
  @IsArray({ message: 'Categories must be an array' })
  @IsOptional()
  categories?: string[];
}
