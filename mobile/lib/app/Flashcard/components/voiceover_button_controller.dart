import 'package:just_audio/just_audio.dart';

class VoiceoverButtonController {
  static play(String audioUrl) async {
    final player = AudioPlayer();

    await player.setUrl(audioUrl);

    await player.play();
    await player.stop();
  }
}
