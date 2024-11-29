import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef InitialProfileIndex = int;

final currentTabIndexProvider = StateProvider<(int, InitialProfileIndex)>((ref) => (0, 0));