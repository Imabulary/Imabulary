import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/app/Home/widgets/CardMenu/card_menu.dart';
import 'package:mobile/app/Set/domain/set.dart';

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
            backgroundColor: Colors.orange,
            leftComponent: const TypeSetting(
              "Loading sets...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF303030),
                height: 1.5,
              ),
            ),
            rightComponent: _buildImageContainer(),
          );
        } else if (snapshot.hasError) {
          return CardMenu(
            backgroundColor: Colors.orange,
            leftComponent: const TypeSetting(
              "Failed to load sets.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.red,
                height: 1.5,
              ),
            ),
            rightComponent: _buildImageContainer(),
          );
        } else if (snapshot.hasData && snapshot.data!.result.isEmpty) {
          return CardMenu(
            backgroundColor: AppColors.orange,
            leftComponent: const TypeSetting(
              "Create your first set",
              textAlign: TextAlign.center,
              variant: TextVariants.headlineLarge,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            rightComponent: _buildImageContainer(),
          );
        } else if (snapshot.hasData && snapshot.data!.result.isNotEmpty) {
          final firstSet = snapshot.data!.result[0];
          return CardMenu(
            backgroundColor: Colors.orange,
            leftComponent: Column(
              children: [
                const TypeSetting(
                  "My sets",
                  textAlign: TextAlign.center,
                  variant: TextVariants.headlineLarge,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TypeSetting(
                  "Number of sets: ${snapshot.data!.result.length}",
                  textAlign: TextAlign.center,
                  variant: TextVariants.bodySmall,
                  style: const TextStyle(color: AppColors.muted),
                )
              ],
            ),
            rightComponent: _buildSetInfo(firstSet),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildImageContainer() {
    return Container(
      height: 140,
      width: 150,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFF303030),
      ),
      child: Image.asset(
        'assets/images/card_example_flower.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSetInfo(Set firstSet) {
    return Container(
      height: 140,
      width: 150,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFF303030),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/card_example_flower.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TypeSetting(firstSet.name),
              TypeSetting(firstSet.flashcards?.length.toString() ?? '0'),
            ],
          ),
        ],
      ),
    );
  }
}
