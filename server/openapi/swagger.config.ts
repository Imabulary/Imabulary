import { SwaggerModule } from '@nestjs/swagger';
import { INestApplication } from '@nestjs/common';
import { join } from 'path';
import { readFile } from 'fs/promises';
import * as yaml from 'js-yaml';

export async function setupSwagger(app: INestApplication) {
  const fileContents = await readFile(
    join(process.cwd(), './openapi/swagger.generated.yaml'),
    'utf-8',
  );

  const document = yaml.load(fileContents);

  SwaggerModule.setup('api', app, document);
}
