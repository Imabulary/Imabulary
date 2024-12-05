import { IsEmail, IsNotEmpty, IsString } from 'class-validator';

export class CreateUserDTO {
  @IsString({ message: 'UID must be a valid string' })
  @IsNotEmpty({ message: 'UID cannot be empty' })
  uid: string;

  /**
   * Email is required if DTO is provided through the API, but still can be undefined
   * if user has used Apple sign in
   */
  @IsEmail({}, { message: 'Email must be a valid email address' })
  @IsNotEmpty({ message: 'Email cannot be empty' })
  email?: string;
}
