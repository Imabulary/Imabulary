import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Profile/widgets/flashcards_grid.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar.dart';

class SetScreen extends ConsumerWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = ref.watch(setServiceProvider);

    return Layout(
      FlashcardsGrid(
        setId: set?.id,
      ),
      appBar: const SetAppBar(),
    );
  }
}
