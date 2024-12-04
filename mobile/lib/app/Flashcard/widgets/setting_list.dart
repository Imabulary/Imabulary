import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:mobile/atoms/type_setting.dart';

class SettingsList extends ConsumerWidget {
  const SettingsList({super.key});

  Future<void> deleteFlashcard(
    BuildContext context,
    String flashcardId,
    WidgetRef ref,
  ) async {
    final flashcardService = ref.read(flashCardRepositoryProvider);

    final success = await flashcardService.delete([flashcardId]);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Flashcard deleted successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete flashcard')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcard = ref.watch(flashcardServiceProvider);

    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          leading: Icon(Icons.delete_forever),
          key: const Key('delete'),
          onTap: () async {
            await deleteFlashcard(context, flashcard!.id, ref);
            ref.invalidate(flashCardRepositoryProvider);
            AutoRouter.of(context).popUntilRoot();
          },
          title: TypeSetting(
            variant: TextVariants.bodyLarge,
            'Delete Flashcard',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: TypeSetting(
            variant: TextVariants.bodySmall,
            'You will NOT get your coin back for deleting a flashcard',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
