import { Transform } from 'class-transformer';
import {
  ArrayNotEmpty,
  IsArray,
  IsBoolean,
  IsNotEmpty,
  IsOptional,
  IsString,
  IsUrl,
  IsUUID,
} from 'class-validator';
import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';

export class LikeFlashcardDto {
  @IsString({ message: 'UID must be a valid string' })
  @IsRecordExist('cards', {
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

  @Transform((value) => value || false)
  @IsBoolean()
  @IsOptional()
  isAppropriate?: boolean;
}

export class CreateNoDesiredObjectFeedbackDTO {
  @IsUrl({}, { message: 'Provide a valid URL for no desired object feedback' })
  @IsNotEmpty({
    message: 'Please provide an image URL for no desired object feedback',
  })
  imageUrl: string;

  @IsString({ each: true, message: 'Each object of must be a string' })
  @IsNotEmpty({
    each: true,
    message:
      'None of objects on image can be empty for no desired object feedback',
  })
  @ArrayNotEmpty({ message: 'Array with objects on image cannot be empty' })
  objectsOnImage: string[];
}
