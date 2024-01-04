import { Injectable } from '@nestjs/common';
import admin from 'firebase-admin';
import { getDownloadURL } from 'firebase-admin/storage';

@Injectable()
export class AppService {
  async uploadToExternalStorage(fileName: string, file: Buffer) {
    const bucket = admin.storage().bucket();
    const storageFile = bucket.file(fileName);

    await storageFile.save(file);

    const imageUrl = await getDownloadURL(storageFile);

    return { imageUrl };
  }
}
