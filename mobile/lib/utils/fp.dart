T identity<T>(T param) => param;

Map<String, dynamic> diff(
  Map<String, dynamic> firstMap,
  Map<String, dynamic> secondMap,
) {
  Map<String, dynamic> differenceMap = {};

  secondMap.forEach((key, value) {
    if (!firstMap.containsKey(key) || firstMap[key] != value) {
      differenceMap[key] = value;
    }
  });

  return differenceMap;
}

Map<String, dynamic> omitNullables(Map<String, dynamic> map) {
  final cleanMap = map;

  cleanMap.removeWhere((key, value) => value == null);

  return cleanMap;
}

String capitalize(String word) {
  if (word.isEmpty) return word;

  return word[0].toUpperCase() + word.substring(1).toLowerCase();
}
