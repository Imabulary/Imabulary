import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/presentation/profile_screen.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/app/Home/widgets/CardMenu/card_menu.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/app/Profile/widgets/SetsGrid/sets_grid_controller.dart';
import 'package:auto_route/auto_route.dart';

class SetsNavigationCard extends StatelessWidget {
  final Future<ServerResponse<List<Set>>> setsDataFuture;

  const SetsNavigationCard({super.key, required this.setsDataFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ServerResponse<List<Set>>>(
      future: setsDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CardMenu(
            backgroundColor: AppColors.orange,
            component: Row(
              children: [
                _buildImageContainer(),
                const SizedBox(
                  width: 10,
                ),
                _buildTextContainer("Loading sets..."),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return CardMenu(
            backgroundColor: Colors.orange,
            component: Row(
              children: [
                _buildImageContainer(),
                const SizedBox(
                  width: 10,
                ),
                _buildTextContainer("Failed to load sets.", color: Colors.red)
              ],
            ),
          );
        } else if (snapshot.hasData && snapshot.data!.result.isEmpty) {
          return CardMenu(
            onTap: SetsGridController.showSetFormBottomSheet(context),
            backgroundColor: AppColors.orange,
            component: Row(
              children: [
                _buildImageContainer(),
                const SizedBox(
                  width: 10,
                ),
                _buildTextContainer("Create your first set")
              ],
            ),
          );
        } else if (snapshot.hasData && snapshot.data!.result.isNotEmpty) {
          final int numberOfSets = snapshot.data!.result.length;

          return CardMenu(
            onTap: () {
              context.router.push(
                ProfileRoute(initialTabIndex: 1),
              );
            },
            backgroundColor: AppColors.orange,
            component: Row(
              children: [
                _buildImageContainer(),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextContainer("My sets"),
                    TypeSetting(
                      "Number of sets: $numberOfSets",
                      variant: TextVariants.bodySmall,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildImageContainer() {
    return SizedBox(
      width: 40,
      child: SvgPicture.asset(
        'assets/images/sets-icon.svg',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTextContainer(String text, {Color color = Colors.black}) {
    return TypeSetting(
      text,
      variant: TextVariants.headlineMedium,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
