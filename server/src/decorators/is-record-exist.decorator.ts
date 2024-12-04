import {
  ValidationOptions,
  ValidatorConstraint,
  ValidatorConstraintInterface,
  registerDecorator,
} from 'class-validator';
import { PrismaService } from 'src/prisma';

@ValidatorConstraint({ async: true })
export class IsRecordExistConstraint implements ValidatorConstraintInterface {
  private readonly entity: string;

  constructor(private readonly prisma: PrismaService, entity: string) {
    this.entity = entity;
  }

  async validate(id: string | string[]) {
    const record = await this.prisma[this.entity].findFirst({ where: { id } });

    return !!record;
  }
}

export function IsRecordExist(
  entity: string,
  validationOptions?: ValidationOptions,
) {
  return function (object: object, propertyName: string) {
    registerDecorator({
      name: 'isEntityUnique',
      target: object.constructor,
      propertyName,
      options: validationOptions,
      constraints: [],
      validator: new IsRecordExistConstraint(new PrismaService(), entity),
    });
  };
}
