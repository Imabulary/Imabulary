import { Injectable } from '@nestjs/common';
import admin from 'firebase-admin';
import { getDownloadURL } from 'firebase-admin/storage';
import vision from '@google-cloud/vision';
import * as path from 'path';

@Injectable()
export class AppService {
  private visionClient = new vision.ImageAnnotatorClient({
    keyFilename: path.resolve(path.join(__dirname, '../admin-account.json')),
  });

  private async uploadToExternalStorage(fileName: string, file: Buffer) {
    const bucket = admin.storage().bucket();
    const storageFile = bucket.file(fileName);

    await storageFile.save(file);

    const imageUrl = await getDownloadURL(storageFile);

    return imageUrl;
  }

  private async analyze(imageUrl: string) {
    const [result] = await this.visionClient.objectLocalization(imageUrl);

    return result.localizedObjectAnnotations[0].name;
  }

  async handleImage(fileName: string, file: Buffer) {
    const imageUrl = await this.uploadToExternalStorage(fileName, file);

    const objectOnImage = await this.analyze(imageUrl);

    return { result: objectOnImage };
  }
}
