import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Home/components/QuizQuickAction/quiz_quick_action_list_item.dart';
import 'package:mobile/app/Set/application/set_provider.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

class QuizQuickAction extends ConsumerWidget {
  const QuizQuickAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sets = ref.watch(findAllSetsProvider(Pagination()));

    print(sets.value?.result);

    return QuizQuickActionListItem('Take a Quiz');
  }
}
