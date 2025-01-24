import {
  ValidationOptions,
  ValidatorConstraint,
  ValidatorConstraintInterface,
  registerDecorator,
} from 'class-validator';
import { PrismaService } from 'src/prisma';

type IsRecordExistArgs = {
  entity: string;
  field?: string;
};

@ValidatorConstraint({ async: true })
export class IsRecordExistConstraint implements ValidatorConstraintInterface {
  private readonly options: IsRecordExistArgs;

  constructor(
    private readonly prisma: PrismaService,
    options: IsRecordExistArgs,
  ) {
    this.options = options;
  }

  async validate(value: string) {
    const record = await this.prisma[this.options.entity].findFirst({
      where: { [this.options.field || 'id']: value },
    });

    return !!record;
  }
}

export function IsRecordExist(
  options: IsRecordExistArgs,
  validationOptions?: ValidationOptions,
) {
  return function (object: object, propertyName: string) {
    registerDecorator({
      name: 'isEntityUnique',
      target: object.constructor,
      propertyName,
      options: validationOptions,
      constraints: [],
      validator: new IsRecordExistConstraint(new PrismaService(), options),
    });
  };
}
