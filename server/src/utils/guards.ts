import { FirebaseError } from 'firebase-admin';

export const isFirebaseError = (
  error: FirebaseError,
): error is FirebaseError => {
  return 'code' in error;
};
