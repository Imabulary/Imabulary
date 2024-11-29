import 'package:mobile/utils/fp.dart';

String mapStatus(String status) {
  if (status.isEmpty) {
    return 'Other';
  }

  return capitalize(status.replaceAll('_', ' '));
}
