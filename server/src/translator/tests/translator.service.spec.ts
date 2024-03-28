import { Test, TestingModule } from '@nestjs/testing';
import { TranslatorService } from '../translator.service';
import { InternalServerErrorException } from '@nestjs/common';
import { TRANSLATOR_GENERIC_ERROR } from '../utils';

describe('TranslatorService', () => {
  let service: TranslatorService;

  const mockTranslator = (translations?: { translatedText?: string }[]) => {
    Reflect.set(service, 'translator', {
      translateText: jest.fn().mockResolvedValue([
        {
          translations,
        },
      ]),
    });
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [TranslatorService],
    }).compile();

    service = module.get<TranslatorService>(TranslatorService);
  });

  it('should return translated word and phrase', async () => {
    mockTranslator([
      { translatedText: 'Яблоко' },
      { translatedText: undefined },
    ]);

    const [word, phrase] = await service.translate(
      ['Apple', 'An apple a day keeps doctor away.'],
      { sourceLanguageCode: 'en-US', targetLanguageCode: 'uk-UA' },
    );

    expect(word).toBe('Яблоко');
    expect(phrase).toBe('');
  });

  it('should throw InternalServerErrorException in case no translations were returned by the translator', async () => {
    mockTranslator();

    expect(async () => {
      await service.translate(['Apple', 'An apple a day keeps doctor away.'], {
        sourceLanguageCode: 'en-US',
        targetLanguageCode: 'uk-UA',
      });
    }).rejects.toThrow(
      new InternalServerErrorException(TRANSLATOR_GENERIC_ERROR),
    );
  });
});
