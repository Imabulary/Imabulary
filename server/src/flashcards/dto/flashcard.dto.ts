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
  @IsNotEmpty({
    message: 'Object name should be defined',
  })
  @IsString()
  objectOnImage: string;

  @IsUrl()
  @IsNotEmpty()
  imageUrl: string;

  @IsString()
  @IsNotEmpty()
  generatedImageName: string;

  @IsBoolean()
  @IsOptional()
  isRegeneration: boolean;
}
