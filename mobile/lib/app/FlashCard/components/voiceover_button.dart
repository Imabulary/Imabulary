import 'package:flutter/material.dart';
import 'package:mobile/app/FlashCard/components/voiceover_button_controller.dart';

class VoiceoverButton extends StatelessWidget {
  const VoiceoverButton({super.key, required this.audioUrl});

  final String audioUrl;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        VoiceoverButtonController.play(audioUrl);
      },
      icon: const Icon(Icons.volume_up),
    );
  }
}
