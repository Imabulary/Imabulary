import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app_router.dart';

class FlashCardItemController {
  static void redirectToFlashCardScreen(BuildContext context) {
    AutoRouter.of(context).push(const FlashcardRoute());
  }
}
