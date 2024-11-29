import { Injectable } from '@nestjs/common';
import admin from 'firebase-admin';
import { File } from '@google-cloud/storage';
import { getDownloadURL } from 'firebase-admin/storage';
import {
  firebaseOperations,
  handleFirebaseException,
  IBucketFolders,
} from './utils';
import { formatFileName } from 'src/utils';

@Injectable()
export class StorageService {
  async upload(bucketFolder: IBucketFolders, fileName: string, file: Buffer) {
    try {
      const generatedFileName = formatFileName(fileName);
      const storageFile = this.findOne(bucketFolder, generatedFileName);

      await storageFile.save(file);

      return { storageFile, generatedFileName };
    } catch (error: any) {
      handleFirebaseException(error, firebaseOperations.UPLOAD);
    }
  }

  getFileURL(file: File) {
    return getDownloadURL(file);
  }

  findOne(bucketFolder: IBucketFolders, fileName: string) {
    const bucket = admin.storage().bucket();
    const storageFile = bucket.file(`${bucketFolder}/${fileName}`);

    return storageFile;
  }

  async delete(
    fileName: string,
    folder: IBucketFolders = IBucketFolders.IMAGE,
  ) {
    try {
      const storageFile = this.findOne(folder, fileName);

      await storageFile.delete();
    } catch (error: any) {
      handleFirebaseException(error, firebaseOperations.DELETE);
    }
  }
}
