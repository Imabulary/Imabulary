import { SwaggerModule } from '@nestjs/swagger';
import { INestApplication } from '@nestjs/common';

export function setupSwagger(app: INestApplication): void {
  SwaggerModule.setup('api', app, undefined, {
    yamlDocumentUrl: 'swagger.yaml',
  });
}
