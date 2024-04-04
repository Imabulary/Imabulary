import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flash_card_repository.g.dart';

final picker = ImagePicker();

class FlashCardRepository {
  FlashCardRepository({required this.client});

  final Dio client;

  Future<List<FlashCard>> findAll(Pagination pagination) {
    return request(() async {
      final url = '${dotenv.env['API_URL']}/flash-cards';
      // TODO: move this to request interceptor
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();

      final response = await client.get(
        url,
        queryParameters: {"pagination": pagination.toJson()},
        options: Options(
          headers: {"authorization": 'Bearer $token'},
        ),
      );

      final List<dynamic> result = response.data!['result'];

      return result.map((result) => FlashCard.fromJson(result)).toList();
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

      // TODO: move this to request interceptor
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();

      final response = await client.post(
        uploadUrl,
        data: data,
        options: Options(
          headers: {"authorization": 'Bearer $token'},
        ),
      );

      return FlashCard.fromJson(response.data!['result']);
    });
  }
}

@riverpod
FlashCardRepository flashCardRepository(FlashCardRepositoryRef ref) =>
    FlashCardRepository(
      client: Dio(),
    );
