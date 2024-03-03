import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  void handleAdd(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Take a photo'),
            onTap: () {
              print('You decided to take a photo');
            },
          ),
          ListTile(
            leading: const Icon(Icons.collections),
            title: const Text('Choose from gallery'),
            onTap: () {
              print('You decided to choose from gallery');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        handleAdd(context);
      },
      backgroundColor: colors['primary'],
      foregroundColor: Colors.black,
      child: const Icon(Icons.add),
    );
  }
}
