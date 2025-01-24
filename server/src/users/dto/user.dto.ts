import { IsEmail, IsNotEmpty, IsOptional, IsString } from 'class-validator';
import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';

export class CreateUserDTO {
  @IsString({ message: 'UID must be a valid string' })
  @IsNotEmpty({ message: 'UID cannot be empty' })
  uid: string;

  @IsEmail({}, { message: 'Email must be a valid email address' })
  @IsOptional()
  email?: string;
}

export class UpdateUserDTO {
  @IsRecordExist(
    { entity: 'products' },
    {
      message: 'Product with provided productId does not exist',
    },
  )
  @IsNotEmpty({ message: 'productId cannot be empty' })
  productId: string;
}
