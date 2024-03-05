import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/flash_card.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/Card/card.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

final dio = Dio();
final picker = ImagePicker();

class _TakePhotoState extends State<TakePhoto> {
  void _showLoadingDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const AlertDialog(
        content: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              TypeSetting('Your image is being processed.'),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: TypeSetting(
          'Oh no! We\'re sorry :(',
          variant: TextVariants.headlineLarge,
        ),
        content: TypeSetting(
          'Something went wrong during image processing. Please, try again later.',
        ),
      ),
    );
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

  void _takePhoto() async {
    final image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 500,
    );

    if (image == null) return;

    final uploadUrl = '${dotenv.env['API_URL']}/upload';
    final file = await MultipartFile.fromFile(image.path);

    final data = FormData.fromMap({
      'file': file,
    });

    _showLoadingDialog();

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

      _showErrorDialog();

      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.camera),
      title: const TypeSetting('Take a photo'),
      onTap: _takePhoto,
    );
  }
}
