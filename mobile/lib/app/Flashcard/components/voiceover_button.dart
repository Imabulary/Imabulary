import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/components/voiceover_button_controller.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/utils/analytics_engine.dart';

class VoiceoverButton extends StatelessWidget {
  const VoiceoverButton({super.key, required this.audioUrl});

  final String audioUrl;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        analyticsEngine
            .trackClick(AnalyticClickEvents.flashcardEngPronunciation);
        VoiceoverButtonController.play(audioUrl);
      },
      icon: const Icon(Icons.volume_up),
    );
  }
}
