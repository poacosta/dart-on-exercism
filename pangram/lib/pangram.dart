class Pangram {
  bool isPangram(String sentence) {
    List<String> dict = [
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "q",
      "r",
      "s",
      "t",
      "u",
      "v",
      "w",
      "x",
      "y",
      "z"
    ];

    if (sentence.isEmpty) return false;

    for (String l in sentence.split('')) {
      String x = l.toLowerCase();
      if (dict.contains(x)) dict.remove(x);
    }

    return dict.length == 0;
  }
}
