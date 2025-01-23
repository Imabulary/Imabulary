import { PartialType } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsBoolean,
  IsNotEmpty,
  IsOptional,
  IsString,
  Length,
} from 'class-validator';

export class CreateSetDto {
  @Length(0, 255, { message: 'Name length cannot exceed 255 characters' })
  @IsString({ message: 'Name must be valid string' })
  @IsNotEmpty({ message: 'Name cannot be empty' })
  name: string;

  @IsString({ message: 'Description must be valid string' })
  @IsOptional()
  description?: string;
}

export class UpdateSetDto extends PartialType(CreateSetDto) {
  @IsBoolean({ message: 'isFinished flag must be a boolean' })
  @IsOptional()
  isFinished?: boolean;
}

export class SetsFilters {
  @Type(() => Boolean)
  @IsBoolean({ message: 'isFinished flag must be a boolean' })
  @IsOptional()
  isFinished?: boolean;
}
