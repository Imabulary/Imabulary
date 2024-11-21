import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class QuizOptionsGridWidget extends StatefulWidget {
  const QuizOptionsGridWidget({
    super.key,
    required this.options,
    required this.onTap,
  });

  final List<FlashCard> options;
  final void Function(FlashCard) onTap;

  @override
  State<QuizOptionsGridWidget> createState() => _QuizOptionsGridWidgetState();
}

class _QuizOptionsGridWidgetState extends State<QuizOptionsGridWidget> {
  FlashCard? selectedOption;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        for (final option in widget.options)
          GestureDetector(
            onTap: () {
              setState(() {
                selectedOption = option;
              });
              Future.delayed(const Duration(milliseconds: 300), () {
                widget.onTap(option);
                selectedOption = null;
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: selectedOption == option
                    ? AppColors.darkYellow
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: selectedOption == option
                      ? Colors.transparent
                      : AppColors.white,
                ),
              ),
              duration: const Duration(milliseconds: 100),
              child: Center(
                child: TypeSetting(
                  option.word,
                  style: TextStyle(
                    color: selectedOption == option
                        ? AppColors.black
                        : AppColors.white,
                  ),
                  variant: TextVariants.bodyLarge,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
