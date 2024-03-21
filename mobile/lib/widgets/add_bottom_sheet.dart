import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/app/FlashCard/presentation/flash_card.dart';
import 'package:mobile/components/dialogs.dart';
import 'package:mobile/components/pick_in_gallery.dart';
import 'package:mobile/components/take_photo.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';
import 'package:mobile/utils/maybe.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

final dio = Dio();
final picker = ImagePicker();

class _AddBottomSheetState extends State<AddBottomSheet> {
  late final Dialogs _dialogs;

  @override
  void initState() {
    _dialogs = Dialogs(context);

    super.initState();
  }

  void redirectToFlashCardScreen(FlashCard flashCard) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlashCardScreen(flashCard: flashCard),
      ),
    );
  }

  void closeDialogs() {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void _pickPhoto(ImageSource source) async {
    final image = await picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 800,
    );

    if (image == null) return;

    final uploadUrl = '${dotenv.env['API_URL']}/upload';
    final file = await MultipartFile.fromFile(image.path);

    final data = FormData.fromMap({
      'file': file,
    });

    _dialogs.showLoadingDialog('Your image is being processed.');

    try {
      final response = await dio.post(
        uploadUrl,
        data: data,
      );

      final flashCard = FlashCard.fromJson(response.data!['result']);

      closeDialogs();

      redirectToFlashCardScreen(flashCard);
    } on DioException catch (error) {
      closeDialogs();

      final errorMessage = Maybe.fromValue(error.response)
          .map((response) => response!.data)
          .map((data) => ServerError.fromJson(data))
          .map((serverError) => serverError.message)
          .getOrElse('');

      _dialogs.showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TakePhoto(pickPhoto: _pickPhoto),
        PickInGallery(pickPhoto: _pickPhoto),
      ],
    );
  }
}
