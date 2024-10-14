import {
  ForbiddenException,
  InternalServerErrorException,
  UnauthorizedException,
} from '@nestjs/common';
import {
  FORBIDDEN_ERROR,
  UNAUTHORIZED_ERROR,
  UNKNOWN_DELETING_ERROR,
  UNKNOWN_UPLOADING_ERROR,
} from './constants';
import { FirebaseError } from 'firebase-admin';
import { FirebaseOperation, firebaseOperations } from './types';

const isFirebaseError = (error: FirebaseError): error is FirebaseError => {
  return 'code' in error;
};

export const handleFirebaseException = (
  error: any,
  operation: FirebaseOperation,
) => {
  const unknownError = {
    [firebaseOperations.UPLOAD]: UNKNOWN_UPLOADING_ERROR,
    [firebaseOperations.DELETE]: UNKNOWN_DELETING_ERROR,
  };

  if (isFirebaseError(error)) {
    const options = {
      cause: error,
    };

    const firebaseExceptionsMap = {
      'storage/unknown': new InternalServerErrorException(
        unknownError[operation],
        options,
      ),
      'storage/unauthenticated': new UnauthorizedException(
        UNAUTHORIZED_ERROR.replace(':operation', operation),
        options,
      ),
      'storage/unauthorized': new ForbiddenException(FORBIDDEN_ERROR, options),
    };

    throw (
      firebaseExceptionsMap[error.code] ||
      new InternalServerErrorException(unknownError[operation], options)
    );
  }

  throw new InternalServerErrorException(unknownError[operation]);
};
