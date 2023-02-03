class Allergies {
  static const _allergenScore = {
    'eggs': 1,
    'peanuts': 2,
    'shellfish': 4,
    'strawberries': 8,
    'tomatoes': 16,
    'chocolate': 32,
    'pollen': 64,
    'cats': 128,
  };

  bool allergicTo(String item, [int? score]) =>
      score! & _allergenScore[item]! != 0;

  List<String> list([int? score]) =>
      _allergenScore.keys.where((item) => allergicTo(item, score)).toList();
}
