import { Test, TestingModule } from '@nestjs/testing';
import { NlpService } from '../nlp.service';
import { PartOfSpeechTag } from '../utils';

describe('NlpService', () => {
  let service: NlpService;

  const mockClient = (
    partOfSpeech?: { tag: PartOfSpeechTag },
    tokens?: Array<{ partOfSpeech: { tag: PartOfSpeechTag } }>,
  ) => {
    Reflect.set(service, 'client', {
      analyzeSyntax: jest
        .fn()
        .mockResolvedValue([{ tokens: tokens ?? [{ partOfSpeech }] }]),
    });
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [NlpService],
    }).compile();

    service = module.get<NlpService>(NlpService);
  });

  describe('speechPart', () => {
    it('should return empty string if no word or language were provided', async () => {
      const result1 = await service.speechPart('');
      const result2 = await service.speechPart(null);
      const result3 = await service.speechPart(undefined);

      expect(result1).toBe('');
      expect(result2).toBe('');
      expect(result3).toBe('');
    });

    it('should detect part of speech for a single provided word', async () => {
      mockClient({ tag: 'NOUN' });

      const result = await service.speechPart('flower');

      expect(result).toBe('noun');
    });

    it('should return empty string if tag was not detected', async () => {
      mockClient();

      const result = await service.speechPart('flower');

      expect(result).toBe('');
    });

    it('should return "noun phrase" as a result if the provided string is a set of nouns', async () => {
      mockClient(null, [
        { partOfSpeech: { tag: 'NOUN' } },
        { partOfSpeech: { tag: 'NOUN' } },
      ]);

      const result = await service.speechPart('tablet computer');

      expect(result).toBe('noun phrase');
    });

    it('should return "phrase" as a result if the provided string is a set of different parts of speech', async () => {
      mockClient(null, [
        { partOfSpeech: { tag: 'NOUN' } },
        { partOfSpeech: { tag: 'ADJ' } },
      ]);

      const result = await service.speechPart(
        'The quick brown fox jumps over the lazy dog',
      );

      expect(result).toBe('phrase');
    });
  });
});
