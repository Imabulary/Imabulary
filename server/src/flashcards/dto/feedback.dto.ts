import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';
import {
  IsString,
  IsOptional,
  IsNotEmpty,
  ValidatorConstraint,
  ValidatorConstraintInterface,
  registerDecorator,
  IsIn,
  ValidationOptions,
  ValidationArguments,
} from 'class-validator';

export class LikeFlashcardDto {
  @IsString({ message: 'UID must be a valid string' })
  @IsRecordExist('cards', {
    each: false,
    message: 'Flashcard is unavailable for feedback',
  })
  cardId: string;
}

@ValidatorConstraint({ async: false })
class EitherCategoryIdOrTextFeedbackConstraint
  implements ValidatorConstraintInterface
{
  validate(_: any, args: ValidationArguments) {
    const dto = args.object as DislikeFlashcardDto;
    return !!dto.categoryId !== !!dto.textFeedback;
  }

  defaultMessage(_: ValidationArguments) {
    return 'Either categoryId or textFeedback must be provided, but not both';
  }
}

function EitherCategoryIdOrTextFeedback(validationOptions?: ValidationOptions) {
  return function (object: Record<string, any>, propertyName: string) {
    registerDecorator({
      name: 'EitherCategoryIdOrTextFeedback',
      target: object.constructor,
      propertyName: propertyName,
      options: validationOptions,
      validator: EitherCategoryIdOrTextFeedbackConstraint,
    });
  };
}

export class DislikeFlashcardDto extends LikeFlashcardDto {
  @IsString()
  @IsOptional()
  textFeedback?: string;

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
    message: 'Either categoryId or textFeedback must be provided, but not both',
  })
  validate: boolean;
}
