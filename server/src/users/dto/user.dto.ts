import { IsEmail, IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class CreateUserDTO {
  @IsString({ message: 'UID must be a valid string' })
  @IsNotEmpty({ message: 'UID cannot be empty' })
  uid: string;

  @IsEmail({}, { message: 'Email must be a valid email address' })
  @IsOptional()
  email?: string;
}
