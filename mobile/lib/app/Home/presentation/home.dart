import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Home/widgets/CardMenu/card_menu.dart';
import 'package:mobile/app/Home/widgets/home_app_title.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/app/Home/widgets/sets_navigation_card.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet.dart';
import 'package:mobile/atoms/type_setting.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(getWalletBalanceProvider);

    final setsRepository = ref.watch(setRepositoryProvider);

    void handleAdd(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        builder: (context) => const AddBottomSheet(),
      );
    }

    return Layout(
      RefreshIndicator(
        onRefresh: () => Future.sync(() {
          ref.invalidate(getWalletBalanceProvider);
          ref.invalidate(setRepositoryProvider);
        }),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HomeAppTitle(wallet: wallet),
                const SizedBox(
                  height: 8,
                ),
                CardMenu(
                  onTap: () {
                    handleAdd(context);
                  },
                  backgroundColor: AppColors.darkYellow,
                  leftComponent: const TypeSetting(
                    "Add a new flashcard",
                    variant: TextVariants.headlineLarge,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  rightComponent: Image.asset(
                    'assets/images/card_example_flower.png',
                    height: 140,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                SetsNavigationCard(
                  setsDataFuture: setsRepository.findAll(
                    const Pagination(page: 1),
                  ),
                ),
                CardMenu(
                  backgroundColor: AppColors.success,
                  leftComponent: const TypeSetting(
                    "Take a quiz",
                    variant: TextVariants.headlineLarge,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  rightComponent: Image.asset(
                    'assets/images/quiz_picture.png',
                    height: 140,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      currentScreen: CurrentScreens.home.value,
    );
  }
}
