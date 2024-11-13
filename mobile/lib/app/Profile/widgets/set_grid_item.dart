import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/components/set_preview.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/plularize.dart';
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

    AutoRouter.of(context).push(const SetRoute());
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
