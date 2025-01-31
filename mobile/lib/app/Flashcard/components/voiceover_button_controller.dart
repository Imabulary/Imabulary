import 'package:just_audio/just_audio.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/utils/analytics_engine.dart';

class VoiceoverButtonController {
  static play(String audioUrl) async {
    analyticsEngine.trackClick(AnalyticClickEvents.flashcardEngPronunciation);
    final player = AudioPlayer();

    await player.setUrl(audioUrl);

    await player.play();
    await player.stop();
  }
}
