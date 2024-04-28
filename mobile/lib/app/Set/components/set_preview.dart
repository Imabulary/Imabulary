// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobile/shared/constants.dart';

class SetPreview extends StatelessWidget {
  const SetPreview({super.key, required this.images});

  final List<({String image_url})> images;

  generateGrid() {
    if (images.isEmpty || images.length == 1) {
      return [const StairedGridTile(1, 1.5)].toList();
    }

    if (images.length == 2 || images.length < 4) {
      return [
        const StairedGridTile(0.5, 0.5),
        const StairedGridTile(0.5, 0.5),
      ].toList();
    }

    if (images.length >= 4) {
      return images
          .sublist(0, 4)
          .map((_) => const StairedGridTile(0.5, 1.4))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      width: double.infinity,
      height: 110,
      child: IgnorePointer(
        child: GridView.custom(
          gridDelegate: SliverStairedGridDelegate(
            pattern: generateGrid(),
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Image.network(
              images.length > index ? images[index].image_url : kStubImageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
