import {
  IsNotEmpty,
  IsNumber,
  IsString,
  IsUUID,
  Max,
  Min,
} from 'class-validator';
import { IsRecordExist } from 'src/decorators/is-record-exist.decorator';

export class SendQuizFeedbackDTO {
  @Max(3, { message: 'Rating must be on a scale from 1 to 3' })
  @Min(1, { message: 'Rating must be on a scale from 1 to 3' })
  @IsNumber({}, { message: 'Rating must be a number' })
  @IsNotEmpty({ message: 'Rating cannot be empty' })
  rating: number;

  @IsRecordExist('sets', {
    message: 'No sets were found by the provided Set ID',
  })
  @IsUUID(4, { message: 'Set ID must be a valid UUID' })
  @IsNotEmpty({ message: 'Set ID cannot be empty' })
  setId: string;
}

export class SendFormFeedbackDTO {
  @IsNotEmpty({ message: 'Feedback cannot be empty' })
  @IsString({ message: 'Feedback must be a string' })
  feedback: string;

  @IsNotEmpty({ message: 'Device type cannot be empty' })
  @IsString({ message: 'Device type must be a string' })
  deviceType: string;

  @IsNotEmpty({ message: 'Device model cannot be empty' })
  @IsString({ message: 'Device model must be a string' })
  deviceModel: string;

  @IsNotEmpty({ message: 'OS name cannot be empty' })
  @IsString({ message: 'OS name must be a string' })
  osName: string;

  @IsNotEmpty({ message: 'OS version cannot be empty' })
  @IsString({ message: 'OS version must be a string' })
  osVersion: string;

  @IsNotEmpty({ message: 'App version cannot be empty' })
  @IsString({ message: 'App version must be a string' })
  appVersion: string;

  @IsNotEmpty({ message: 'Connection type cannot be empty' })
  @IsString({ message: 'Connection type must be a string' })
  connectionType: string;

  @IsNotEmpty({ message: 'Screen resolution cannot be empty' })
  @IsString({ message: 'Screen resolution must be a string' })
  screenResolution: string;
}
