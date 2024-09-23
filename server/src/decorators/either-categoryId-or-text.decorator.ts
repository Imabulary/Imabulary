import {
  ValidatorConstraint,
  ValidatorConstraintInterface,
  ValidationOptions,
  ValidationArguments,
  registerDecorator,
} from 'class-validator';
import { DislikeFlashcardDto } from '../feedback/dto/feedback.dto';

@ValidatorConstraint({ async: false })
class EitherCategoryIdOrTextFeedbackConstraint
  implements ValidatorConstraintInterface
{
  validate(_: any, args: ValidationArguments) {
    const dto = args.object as DislikeFlashcardDto;
    return !!dto.categories.length !== !!dto.text;
  }
}

export function EitherCategoryIdOrTextFeedback(
  validationOptions?: ValidationOptions,
) {
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
