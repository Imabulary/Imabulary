import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MockFile {
  MockFile({required this.xFile, required this.file});

  final XFile xFile;
  final File file;

  static MockFile createFile({bool keepFile = false}) {
    final file = File('./test.txt');

    file.createSync();

    final xFile = XFile(file.path);

    if (!keepFile) {
      file.deleteSync();
    }

    return MockFile(xFile: xFile, file: file);
  }
}
