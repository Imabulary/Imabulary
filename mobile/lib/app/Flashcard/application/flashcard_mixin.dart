import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Flashcard/domain/scanPhotoPayload/scan_photo_payload.dart';
import 'package:mobile/app/Flashcard/presentation/flashcard_screen.dart';
import 'package:mobile/app/ObjectsOnImage/domain/ObjectOnImage/object_on_image.dart';
import 'package:mobile/app/ObjectsOnImage/presentation/objects_on_image_screen.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/utils/either.dart';

mixin FlashcardMixin {
  /// Parses the given [response] to determine the appropriate payload type.
  ///
  /// This method checks if `objectsOnImage` exists within the `result` field
  /// of the [response] data. If it does, it assumes the response is intended
  /// for further processing and returns an `Either` with a [ScanPhotoPayload] as the left value.
  /// Otherwise, it returns an `Either` with a [FlashCard] as the right value.
  ///
  /// - Returns an [Either] where:
  ///   - Left: A [ScanPhotoPayload] created from the `result` if `objectsOnImage` is present.
  ///   - Right: A [FlashCard] created from the `result` if `objectsOnImage` is absent.
  ///
  /// Example:
  /// ```dart
  /// final result = _parseImageProcessingPayload(response);
  /// if (result.isLeft()) {
  ///   // Process as ScanPhotoPayload
  /// } else {
  ///   // Process as FlashCard
  /// }
  /// ```
  Either<ScanPhotoPayload, FlashCard> parseImageProcessingPayload(
          Response<dynamic> response) =>
      response.data['result']['objectsOnImage'] != null
          ? Either.fromLeft(
              ScanPhotoPayload.fromJson(
                response.data['result'],
              ),
            )
          : Either.fromRight(
              FlashCard.fromJson(
                response.data['result'],
              ),
            );

  /// Handles the result of an image processing operation and navigates
  /// to the appropriate screen based on the content of the result.
  ///
  /// This method checks whether [result] contains a [ScanPhotoPayload] or a [FlashCard].
  /// - If [result] is a [FlashCard], it opens the flashcard and navigates to [FlashcardScreen].
  /// - If [result] is a [ScanPhotoPayload], it maps the list of objects on the image
  ///   and navigates to [ObjectsOnImageScreen] with the prepared data.
  Future<void> redirectAfterImageProcessing(
    Either<ScanPhotoPayload, FlashCard> result,
    AutoDisposeAsyncNotifierProviderRef<void> ref,
    BuildContext context,
  ) async {
    final flashcardServiceNotifier = ref.read(
      flashcardServiceProvider.notifier,
    );

    if (result.isRight) {
      flashcardServiceNotifier.openFlashcard(result.right!);

      AutoRouter.of(context).push(const FlashcardRoute());
    } else {
      final scanPhotoPayload = result.left;
      final objectsOnImage =
          scanPhotoPayload!.objectsOnImage.map(ObjectOnImage.fromJson).toList();

      objectsOnImage.sort((a, b) => b.score.compareTo(a.score));

      AutoRouter.of(context).push(
        ObjectsOnImageRoute(
          objectsOnImage: objectsOnImage,
          scanPhotoPayload: scanPhotoPayload,
        ),
      );
    }
  }
}
