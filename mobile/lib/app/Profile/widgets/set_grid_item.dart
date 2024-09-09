import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Set/application/set_service.dart';
import 'package:Imabulary/app/Set/components/set_preview.dart';
import 'package:Imabulary/app/Set/domain/set.dart';
import 'package:Imabulary/app/Set/presentation/set_screen.dart';
import 'package:Imabulary/atoms/type_setting.dart';
import 'package:Imabulary/utils/plularize.dart';
import 'package:timeago/timeago.dart' as timeago;

class SetGridItem extends ConsumerStatefulWidget {
  const SetGridItem({super.key, required this.set});

  final Set set;

  @override
  ConsumerState<SetGridItem> createState() => _SetGridItemState();
}

// TODO: add tests
class _SetGridItemState extends ConsumerState<SetGridItem> {
  _navigateToSetScreen() {
    ref.read(setServiceProvider.notifier).openSet(widget.set);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SetScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final updatedAgo = timeago
        .format(widget.set.updatedAt, locale: 'en_short')
        .replaceAll('~', '');

    final setsCount = pluralize('flashcard', widget.set.flashcards?.length);

    final setFlashcards = widget.set.flashcards ?? [];

    return GestureDetector(
      onTap: _navigateToSetScreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SetPreview(images: setFlashcards),
          const SizedBox(
            height: 4,
          ),
          TypeSetting(
            widget.set.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TypeSetting(
            '$setsCount • $updatedAgo',
            variant: TextVariants.bodySmall,
          )
        ],
      ),
    );
  }
}
