import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/widgets/DeleteDataDialog/delete_data_dialog.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class ProfileManageAccountController {
  static void Function() showSetsBottomSheet(BuildContext context) => () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(24),
            child: FractionallySizedBox(
              heightFactor: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              size: 24.0,
                              color: Color(0xFFE8EAED),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const TypeSetting(
                            'Delete all your data',
                            variant: TextVariants.headlineLarge,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const TypeSetting(
                        'This action is irreversible. Your progress and purchases will be permanently deleted, and you will be logged out. You can create a new account with the same credentials, but all purchases will be lost with no refund.',
                        variant: TextVariants.bodyLarge,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DeleteDataDialog();
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const TypeSetting(
                        'Delete my data',
                        variant: TextVariants.bodyLarge,
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      };
}
