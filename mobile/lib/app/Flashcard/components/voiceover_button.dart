import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/components/voiceover_button_controller.dart';

class VoiceoverButton extends StatefulWidget {
  const VoiceoverButton({super.key, required this.audioUrl});

  final String audioUrl;

  @override
  State<VoiceoverButton> createState() => _VoiceoverButtonState();
}

class _VoiceoverButtonState extends State<VoiceoverButton> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (!isPlaying) {
          setState(() => isPlaying = true);
          await VoiceoverButtonController.play(widget.audioUrl);
          setState(() => isPlaying = false);
        }
      },
      icon: Icon(
        isPlaying ? Icons.volume_up_outlined : Icons.volume_off_outlined,
      ),
    );
  }
}
