class Acronym {
  String abbreviate(String text) {
    String result = "";
    for (final Match m in RegExp(r"[^\s-,_]+").allMatches(text))
      result += m[0]![0];
    return result.toUpperCase();
  }
}
