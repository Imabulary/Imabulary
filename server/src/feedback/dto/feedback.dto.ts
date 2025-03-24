import { Type } from 'class-transformer';
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

export class DislikeFlashcardDTO {
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

export class CreateFeedbackDto extends DislikeFlashcardDTO {
  @IsUUID(4, { message: 'Card ID must be a valid UUID string' })
  @IsOptional()
  cardId?: string;

  @Type(() => Boolean)
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

export class FindOneDTO {
  @IsNotEmpty({ message: '' })
  cardId: string;
}
