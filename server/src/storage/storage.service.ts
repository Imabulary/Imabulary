import { Injectable } from '@nestjs/common';
import { randomUUID } from 'crypto';
import admin from 'firebase-admin';
import { File } from '@google-cloud/storage';
import { getDownloadURL } from 'firebase-admin/storage';
import { handleUploadException } from './utils';

@Injectable()
export class StorageService {
  async upload(fileName: string, file: Buffer) {
    try {
      const uuid = randomUUID();
      const bucket = admin.storage().bucket();
      const storageFile = bucket.file(`${uuid}_${fileName}`);

      await storageFile.save(file);

      return storageFile;
    } catch (error: any) {
      handleUploadException(error);
    }
  }

  getImageURL(file: File) {
    return getDownloadURL(file);
  }
}
