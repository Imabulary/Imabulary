import { Test, TestingModule } from '@nestjs/testing';
import { AssistantService } from '../assistant.service';
import { InternalServerErrorException } from '@nestjs/common';
import { ASSISTANT_GENERIC_ERROR } from '../utils';

describe('AssistantService', () => {
  let service: AssistantService;

  const mockGenerativeModel = (content?: { parts: { text: string }[] }) => {
    Reflect.set(service, 'generativeModel', {
      generateContent: jest.fn().mockResolvedValue({
        response: {
          candidates: [
            {
              content,
            },
          ],
        },
      }),
    });
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AssistantService],
    }).compile();

    service = module.get<AssistantService>(AssistantService);
  });

  it('should return a phrase generated based on the given word', async () => {
    mockGenerativeModel({
      parts: [{ text: 'An apple a day keeps doctor away.' }],
    });

    const phrase = await service.generatePhrase('Apple');

    expect(phrase).toBe('An apple a day keeps doctor away.');
  });

  it('should throw InternalServerErrorException in case phrase was not generated correctly', async () => {
    mockGenerativeModel();

    expect(async () => {
      await service.generatePhrase('Apple');
    }).rejects.toThrow(
      new InternalServerErrorException(
        ASSISTANT_GENERIC_ERROR.replace(':word', 'Apple'),
      ),
    );
  });
});
