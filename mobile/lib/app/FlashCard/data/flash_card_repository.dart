import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flash_card_repository.g.dart';

final picker = ImagePicker();

class FlashCardRepository {
  FlashCardRepository({required this.client});

  final Dio client;

  Future<ServerResponse<List<FlashCard>>> findAll(Pagination pagination) {
    return request(() async {
      final url = '${dotenv.env['API_URL']}/flashcards';

      final response = await client.get(
        url,
        queryParameters: {"pagination": pagination.toJson()},
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
      final uploadUrl = '${dotenv.env['API_URL']}/upload';
      final file = await MultipartFile.fromFile(image.path);

      final data = FormData.fromMap({
        'file': file,
      });

      final response = await client.post(
        uploadUrl,
        data: data,
      );

      return FlashCard.fromJson(response.data!['result']);
    });
  }
}

@riverpod
FlashCardRepository flashCardRepository(FlashCardRepositoryRef ref) =>
    FlashCardRepository(client: getDioClient());
