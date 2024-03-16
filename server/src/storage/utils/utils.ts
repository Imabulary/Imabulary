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
    const firebaseExceptionsMap = {
      'storage/unknown': new InternalServerErrorException(UNKNOWN_ERROR, {
        cause: error,
      }),
      'storage/unauthenticated': new UnauthorizedException(UNAUTHORIZED_ERROR, {
        cause: error,
      }),
      'storage/unauthorized': new ForbiddenException(FORBIDDEN_ERROR, {
        cause: error,
      }),
    };

    throw (
      firebaseExceptionsMap[error.code] ||
      new InternalServerErrorException(UNKNOWN_ERROR, {
        cause: error,
      })
    );
  }

  throw new InternalServerErrorException(UNKNOWN_ERROR);
};
