import { Injectable } from '@nestjs/common';
import { randomUUID } from 'crypto';
import admin from 'firebase-admin';
import { getDownloadURL } from 'firebase-admin/storage';
import { handleUploadException } from './utils';

@Injectable()
export class StorageService {
  async upload(fileName: string, file: Buffer) {
    try {
      const bucket = admin.storage().bucket();

      const uuid = randomUUID();
      const storageFile = bucket.file(`${uuid}_${fileName}`);

      await storageFile.save(file);

      const imageUrl = await getDownloadURL(storageFile);

      return imageUrl;
    } catch (error: any) {
      handleUploadException(error);
    }
  }
}
