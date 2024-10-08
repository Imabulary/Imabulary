import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Home/widgets/CardMenu/card_menu.dart';
import 'package:mobile/app/Home/widgets/quiz_card.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/app/Home/widgets/sets_navigation_card.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickActions extends ConsumerWidget {
  final SetRepository setsRepository;

  const QuickActions({super.key, required this.setsRepository});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleGenerateFlashcard(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        builder: (context) => const AddBottomSheet(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TypeSetting(
          "Quick actions",
          variant: TextVariants.headlineMedium,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        CardMenu(
          onTap: () {
            handleGenerateFlashcard(context);
          },
          backgroundColor: AppColors.darkYellow,
          component: Row(
            children: [
              SizedBox(
                width: 40,
                child: SvgPicture.asset(
                  'assets/images/flashcard-icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const TypeSetting(
                "Add a new flashcard",
                variant: TextVariants.headlineMedium,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SetsNavigationCard(
          setsDataFuture: setsRepository.findAll(
            const Pagination(page: 1),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        QuizCard(setsRepository: setsRepository)
      ],
    );
  }
}
