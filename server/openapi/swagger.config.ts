import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { INestApplication } from '@nestjs/common';

export async function setupSwagger(app: INestApplication) {
  const config = new DocumentBuilder()
    .setTitle('Imabulary API')
    .setDescription(
      'Imabulary API for managing and accessing resources easily for smooth system integration.',
    )
    .setVersion('1.0.1') // TODO: set version dynamically
    .build();

  const documentFactory = () => SwaggerModule.createDocument(app, config);

  SwaggerModule.setup('api', app, documentFactory);
}
