import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Home/components/SetQuickAction/set_quick_action_list_item.dart';
import 'package:mobile/app/Home/utils/constants.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Main/application/main_provider.dart';
import 'package:mobile/app/Profile/widgets/SetsGrid/sets_grid_controller.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/analytics_engine.dart';

class SetQuickAction extends ConsumerWidget {
  const SetQuickAction({super.key, required this.sets});

  final AsyncValue<ServerResponse<List<Set>>> sets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return sets.when(
      data: (data) => SetQuickActionListItem(
        data.result.isEmpty ? 'Create your first set' : 'My Sets',
        sublabel:
            data.result.isEmpty ? null : 'Number of sets: ${data.totalItems}',
        onTap: () {
          if (data.result.isEmpty) {
            SetsGridController.showSetFormBottomSheet(context)();
          } else {
            analyticsEngine.trackClick(AnalyticClickEvents.homeMySet);
            ref.read(currentTabIndexProvider.notifier).state =
                (CurrentScreen.profile.value, 1);
          }
        },
      ),
      loading: () => const SetQuickActionListItem('Loading...'),
      error: (error, _) => const SetQuickActionListItem(
        kQuickActionUnavailableErrorTitle,
        sublabel: kQuickActionUnavailableErrorSubtitle,
      ),
    );
  }
}
