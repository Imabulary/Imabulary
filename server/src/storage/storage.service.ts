import { Injectable } from '@nestjs/common';
import admin from 'firebase-admin';
import { File } from '@google-cloud/storage';
import { getDownloadURL } from 'firebase-admin/storage';
import { handleUploadException } from './utils';
import { formatFileName } from 'src/utils';

@Injectable()
export class StorageService {
  async upload(fileName: string, file: Buffer) {
    try {
      const generatedFileName = formatFileName(fileName);
      const storageFile = this.findOne(generatedFileName);

      await storageFile.save(file);

      return { storageFile, generatedFileName };
    } catch (error: any) {
      handleUploadException(error);
    }
  }

  getImageURL(file: File) {
    return getDownloadURL(file);
  }

  findOne(fileName: string) {
    const bucket = admin.storage().bucket();
    const storageFile = bucket.file(fileName);
    return storageFile;
  }

  async delete(fileName: string) {
    try {
      const storageFile = this.findOne(fileName);

      await storageFile.delete();
    } catch (error: any) {
      handleUploadException(error);
    }
  }
}
