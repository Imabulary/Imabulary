import { PartialType } from '@nestjs/mapped-types';
import {
  ArrayNotEmpty,
  IsNotEmpty,
  IsUUID,
  IsString,
  IsBoolean,
  IsOptional,
  IsUrl,
} from 'class-validator';
import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';

export class OrganizeFlashcardsDTO {
  @IsRecordExist('cards', {
    each: true,
    message: "One or more flashcards you want to organize don't exist",
  })
  @IsUUID('4', {
    each: true,
    message: 'Wrong flashcard identifiers were provided',
  })
  @ArrayNotEmpty({ message: 'Provide flashcards you want to organize' })
  flashcardIds: string[];

  @IsRecordExist('sets', {
    message:
      "One or more sets you want to organise flashcards into don't exist",
  })
  @IsUUID('4', { message: 'Wrong set identifiers were provided' })
  @IsNotEmpty({
    message: 'Provide a set you want to organize flashcards into',
  })
  setId: string;
}

export class DisorganizeFlashcardsDTO extends PartialType(
  OrganizeFlashcardsDTO,
) {}

export class CreateFlashcardDTO {
  @IsString({ message: 'Object name must be a string' })
  @IsNotEmpty({
    message: 'Please provide a name of the object on an image',
  })
  objectOnImage: string;

  @IsUrl({}, { message: 'Please provide a valid image URL' })
  @IsNotEmpty({ message: 'Please provide an image URL' })
  imageUrl: string;

  @IsString({ message: 'Name of the image must be a string' })
  @IsNotEmpty({ message: 'Please provide an image name' })
  imageName: string;

  @IsBoolean()
  @IsOptional()
  isRegeneration?: boolean;
}
