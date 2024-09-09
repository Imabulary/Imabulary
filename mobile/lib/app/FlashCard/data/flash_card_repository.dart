import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Imabulary/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:Imabulary/app/Flashcard/domain/card.dart';
import 'package:Imabulary/shared/models/ServerResponse/server_response.dart';
import 'package:Imabulary/utils/api.dart';
import 'package:Imabulary/utils/query_params_builder.dart';
import 'package:Imabulary/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flash_card_repository.g.dart';

final picker = ImagePicker();

class FlashCardRepository {
  FlashCardRepository({required this.client});

  final Dio client;

  String get endpoint => '${dotenv.env['API_URL']}/flashcards';

  Future<ServerResponse<List<FlashCard>>> findAll(
    FindAllFlashcardsDTO findAllFlashcardsDTO,
  ) {
    final queryParamsManager = QueryParamsManager();
    final queryParameters = queryParamsManager.buildFlashcardsInSetQueryParams(
      findAllFlashcardsDTO.pagination,
      setId: findAllFlashcardsDTO.setId,
    );

    return request(() async {
      final response = await client.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return ServerResponse.extract<FlashCard>(response, FlashCard.fromJson);
    });
  }

  Future<XFile?> pickPhoto(ImageSource source) {
    return request(() {
      return picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 800,
      );
    });
  }

  Future<FlashCard> scanPhoto(XFile image) {
    return request(() async {
      final file = await MultipartFile.fromFile(image.path);

      final data = FormData.fromMap({
        'file': file,
      });

      final response = await client.post(
        '$endpoint/scan',
        data: data,
      );

      return FlashCard.fromJson(response.data!['result']);
    });
  }

  Future<List<dynamic>> organize(OrganizeFlashcardDTO organizeFlashcardDto) {
    return request(() async {
      final response = await client.put(
        '$endpoint/organize',
        data: organizeFlashcardDto.toJson(),
      );

      return response.data['result'];
    });
  }

  Future<List<dynamic>> disorganize(
    OrganizeFlashcardDTO disorganizeFlashcardDto,
  ) {
    return request(() async {
      final response = await client.delete(
        '$endpoint/disorganize',
        data: disorganizeFlashcardDto.toJson(),
      );

      return response.data['result'];
    });
  }
}

@riverpod
FlashCardRepository flashCardRepository(FlashCardRepositoryRef ref) =>
    FlashCardRepository(client: getDioClient());
