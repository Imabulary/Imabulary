import { IsEmail, IsNotEmpty, IsString } from 'class-validator';

export class CreateUserDTO {
  @IsString({ message: 'UID must be a valid string' })
  @IsNotEmpty({ message: 'UID cannot be empty' })
  uid: string;

  @IsEmail({}, { message: 'Email must be a valid email address' })
  @IsNotEmpty({ message: 'Email cannot be empty' })
  email: string;
}

export class DeleteUserDTO {
  @IsString({ message: 'UID must be a valid string' })
  @IsNotEmpty({ message: 'UID cannot be empty' })
  uid: string;
}
