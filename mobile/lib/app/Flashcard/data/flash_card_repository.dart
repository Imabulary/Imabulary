import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/domain/scanPhotoPayload/scan_photo_payload.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/either.dart';
import 'package:mobile/utils/query_params_builder.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flash_card_repository.g.dart';

final picker = ImagePicker();

class FlashCardRepository {
  FlashCardRepository({required this.dio});

  final Dio dio;

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
      final response = await dio.get(
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

  Future<Either<ScanPhotoPayload, FlashCard>> scanPhoto(XFile image) {
    return request(() async {
      final file = await MultipartFile.fromFile(image.path);

      final data = FormData.fromMap({
        'file': file,
      });

      final response = await dio.post(
        '$endpoint/scan',
        data: data,
      );

      if (response.data['result']['objectsOnImage'] != null) {
        return Either.fromLeft(ScanPhotoPayload.fromJson(
          response.data['result'],
        ));
      }

      return Either.fromRight(FlashCard.fromJson(
        response.data['result'],
      ));
    });
  }

  Future<FlashCard> create(CreateFlashcardDTO createFlashcardDto) {
    return request(() async {
      final result = await dio.post(
        '$endpoint/create',
        data: createFlashcardDto.toJson(),
      );

      return FlashCard.fromJson(result.data['result']);
    });
  }

  Future<List<dynamic>> organize(OrganizeFlashcardDTO organizeFlashcardDto) {
    return request(() async {
      final response = await dio.put(
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
      final response = await dio.delete(
        '$endpoint/disorganize',
        data: disorganizeFlashcardDto.toJson(),
      );

      return response.data['result'];
    });
  }
}

@riverpod
FlashCardRepository flashCardRepository(FlashCardRepositoryRef ref) =>
    FlashCardRepository(dio: getDioClient());
