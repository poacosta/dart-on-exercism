class Isogram {
  bool isIsogram(String input) {
    input = input.toLowerCase();
    for (int i = 0; i < input.length; i++) {
      if (input[i] == ' ' || input[i] == '-') continue;
      if (input.indexOf(input[i]) != i) return false;
    }
    return true;
  }
}
