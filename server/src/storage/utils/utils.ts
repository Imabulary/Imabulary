import {
  ForbiddenException,
  InternalServerErrorException,
  UnauthorizedException,
} from '@nestjs/common';
import {
  FORBIDDEN_ERROR,
  UNAUTHORIZED_ERROR,
  UNKNOWN_ERROR,
} from './constants';
import { FirebaseError } from 'firebase-admin';

const isFirebaseError = (error: FirebaseError): error is FirebaseError => {
  return 'code' in error;
};

export const handleUploadException = (error: any) => {
  if (isFirebaseError(error)) {
    const options = {
      cause: error,
    };

    const firebaseExceptionsMap = {
      'storage/unknown': new InternalServerErrorException(
        UNKNOWN_ERROR,
        options,
      ),
      'storage/unauthenticated': new UnauthorizedException(
        UNAUTHORIZED_ERROR,
        options,
      ),
      'storage/unauthorized': new ForbiddenException(FORBIDDEN_ERROR, options),
    };

    throw (
      firebaseExceptionsMap[error.code] ||
      new InternalServerErrorException(UNKNOWN_ERROR, options)
    );
  }

  throw new InternalServerErrorException(UNKNOWN_ERROR);
};
