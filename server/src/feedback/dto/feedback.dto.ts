import { IsOptional, IsString, IsArray, IsUUID } from 'class-validator';
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
  @IsString({ message: 'UID must be a valid string' })
  @IsOptional()
  cardId?: string;

  @IsString()
  @IsOptional()
  text?: string;

  @IsArray()
  @IsUUID(4, { each: true })
  @IsOptional()
  categories?: string[];
}
