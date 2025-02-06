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

  @IsString({ message: 'Firebase user ID must be a string' })
  @IsNotEmpty({ message: 'Firebase user ID cannot be empty' })
  firebaseUserId: string;
}
