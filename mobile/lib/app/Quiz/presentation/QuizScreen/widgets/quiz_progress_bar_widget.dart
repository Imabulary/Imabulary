import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';

class QuizProgressBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const QuizProgressBarWidget({
    super.key,
    required this.currentValue,
    required this.totalValue,
  });

  final int currentValue;
  final int totalValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        tween: Tween(
          begin: 0,
          end: currentValue / totalValue,
        ),
        builder: (context, leftFlex, child) {
          final double rightFlex = (1 - leftFlex).toDouble();
          return Row(
            children: [
              Expanded(
                flex: (leftFlex * 100).round(),
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.darkYellow,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                flex: (rightFlex * 100).round(),
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.biege,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                  color: AppColors.darkYellow,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(4);
}