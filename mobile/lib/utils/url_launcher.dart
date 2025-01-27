import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static launch(String uri) async {
    await launchUrl(Uri.parse(uri));
  }
}
