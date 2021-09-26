int findNumberByLetter(String letter) {
  Map<String, int> letters = {
    "AEIOULNRST": 1,
    "DG": 2,
    "BCMP": 3,
    "FHVWY": 4,
    'K': 5,
    "JX": 8,
    "QZ": 10
  };

  int? number;
  var keys = letters.keys;

  for (int i = 0; i < letters.length; i++) {
    var k = keys.firstWhere((e) => e.contains(letter.toUpperCase()));
    if (k.isNotEmpty) {
      number = letters[k];
    }
  }

  return number ?? 0;
}

int score(String text) {
  int result = 0;

  for (var i = 0; i < text.length; i++) {
    result += findNumberByLetter(text[i]);
  }

  return result;
}
