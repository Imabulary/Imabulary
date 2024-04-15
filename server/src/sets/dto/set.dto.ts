import { PartialType } from '@nestjs/mapped-types';
import { IsNotEmpty, IsOptional, IsString, Length } from 'class-validator';

export class CreateSetDto {
  @Length(0, 255, { message: 'Name length cannot exceed 255 characters' })
  @IsString({ message: 'Name must be valid string' })
  @IsNotEmpty({ message: 'Name cannot be empty' })
  name: string;

  @IsString({ message: 'Description must be valid string' })
  @IsOptional()
  description?: string;
}

export class UpdateSetDto extends PartialType(CreateSetDto) {}
