import 'package:Imabulary/app/Flashcard/domain/card.dart';
import 'package:Imabulary/shared/models/ServerError/server_error.dart';

const flashCardFixture = FlashCard(
  id: '1',
  word: 'hello',
  phrase: 'Hello, how are you?',
  translated_phrase: 'Hola, ¿cómo estás?',
  translated_word: 'Hola',
  target_language: 'Spanish',
  source_language: 'English',
  image_url: 'https://example.com/hello.png',
);

const flashCardMapFixture = {
  'id': '1',
  'word': 'hello',
  'phrase': 'Hello, how are you?',
  'translated_phrase': 'Hola, ¿cómo estás?',
  'translated_word': 'Hola',
  'target_language': 'Spanish',
  'source_language': 'English',
  'image_url': 'https://example.com/hello.png',
};

const encodedServerErrorResponse = {
  "message": "Bad request. Try again",
  "statusCode": 400
};

const decodedServerError = ServerError(
  statusCode: 400,
  message: 'Bad request. Try again',
);
