import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Home/widgets/FlashcardListItem/flashcard_list_item.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Main/application/main_provider.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class FlashCardsList extends ConsumerStatefulWidget {
  const FlashCardsList({super.key, required this.flashCards});

  final List<FlashCard> flashCards;

  @override
  ConsumerState<FlashCardsList> createState() => _FlashCardsListState();
}

class _FlashCardsListState extends ConsumerState<FlashCardsList> {
  void redirectToProfileScreen() {
    ref.read(currentTabIndexProvider.notifier).state = (CurrentScreen.profile.value, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => FlashCardListItem(
            widget.flashCards[index],
          ),
          itemCount: widget.flashCards.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 12,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        if (widget.flashCards.isNotEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ElevatedButton(
                onPressed: redirectToProfileScreen,
                child: const TypeSetting(
                  'View all',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
