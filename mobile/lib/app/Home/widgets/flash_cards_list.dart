import 'package:flutter/material.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/app/Profile/presentation/profile.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/widgets/flash_card_list_item.dart';

class FlashCardsList extends StatefulWidget {
  const FlashCardsList({super.key, required this.flashCards});

  final List<FlashCard> flashCards;

  @override
  State<FlashCardsList> createState() => _FlashCardsListState();
}

class _FlashCardsListState extends State<FlashCardsList> {
  void redirectToProfileScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              FlashCardListItem(widget.flashCards[index]),
          itemCount: widget.flashCards.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 12),
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
                child: const TypeSetting('View all'),
              ),
            ),
          ),
      ],
    );
  }
}
