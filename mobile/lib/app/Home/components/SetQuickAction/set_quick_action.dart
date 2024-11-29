import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Home/components/SetQuickAction/set_quick_action_list_item.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Main/application/main_provider.dart';
import 'package:mobile/app/Profile/widgets/SetsGrid/sets_grid_controller.dart';
import 'package:mobile/app/Set/application/set_provider.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

class SetQuickAction extends ConsumerWidget {
  const SetQuickAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sets = ref.watch(
      findAllSetsProvider(const Pagination()),
    );

    return sets.when(
      data: (data) => SetQuickActionListItem(
        data.result.isEmpty ? 'Create your first set' : 'My Sets',
        sublabel:
            data.result.isEmpty ? null : 'Number of sets: ${data.totalItems}',
        onTap: data.result.isNotEmpty
            ? () {
                ref.read(currentTabIndexProvider.notifier).state =
                    (CurrentScreen.profile.value, 1);
              }
            : SetsGridController.showSetFormBottomSheet(context),
      ),
      loading: () => const SetQuickActionListItem('Loading...'),
      error: (error, _) => const SetQuickActionListItem(
        'Quick action temporary unavailable. Please try again later.',
      ),
    );
  }
}
