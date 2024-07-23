import { BadRequestException, Injectable } from '@nestjs/common';
import admin from 'firebase-admin';
import { File } from '@google-cloud/storage';
import { getDownloadURL } from 'firebase-admin/storage';
import { handleUploadException } from './utils';

@Injectable()
export class StorageService {
  async upload(fileName: string, file: Buffer) {
    try {
      const bucket = admin.storage().bucket();
      const storageFile = bucket.file(fileName);

      await storageFile.save(file);

      return storageFile;
    } catch (error: any) {
      handleUploadException(error);
    }
  }

  getImageURL(file: File) {
    return getDownloadURL(file);
  }

  async delete(fileName: string) {
    try {
      const bucket = admin.storage().bucket();
      const storageFile = bucket.file(fileName);

      await storageFile.delete();
    } catch (error: any) {
      handleUploadException(error);
    }
  }
}
