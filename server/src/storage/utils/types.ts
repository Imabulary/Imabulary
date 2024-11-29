export enum IBucketFolders {
  IMAGE = 'image',
  AUDIO = 'audio',
}

export const firebaseOperations = {
  UPLOAD: 'upload',
  DELETE: 'delete',
} as const;

export type FirebaseOperation =
  (typeof firebaseOperations)[keyof typeof firebaseOperations];
