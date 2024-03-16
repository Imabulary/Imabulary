import {
  ForbiddenException,
  InternalServerErrorException,
  UnauthorizedException,
} from '@nestjs/common';
import { isFirebaseError } from 'src/utils';
import {
  FORBIDDEN_ERROR,
  UNAUTHORIZED_ERROR,
  UNKNOWN_ERROR,
} from './constants';

export const handleUploadException = (error: any) => {
  if (isFirebaseError(error)) {
    const firebaseExceptionsMap = {
      'storage/unknown': new InternalServerErrorException(UNKNOWN_ERROR),
      'storage/unauthenticated': new UnauthorizedException(UNAUTHORIZED_ERROR),
      'storage/unauthorized': new ForbiddenException(FORBIDDEN_ERROR),
    };

    throw (
      firebaseExceptionsMap[error.code] ||
      new InternalServerErrorException(UNKNOWN_ERROR)
    );
  }

  throw new InternalServerErrorException(UNKNOWN_ERROR);
};
