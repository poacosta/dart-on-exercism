class WordCount {
  Map<String, int> countWords(String phrase) {
    Map<String, int> result = {};
    String keys = phrase.replaceAll(RegExp(r"([^\w\d|\'])"), '*').toLowerCase();

    keys.split(RegExp(r'\*+')).forEach((key) {
      if (key.isNotEmpty) {
        if (RegExp(r"'\w+\'").hasMatch(key))
          key = key.replaceAll(RegExp(r"\'"), '');

        result.containsKey(key)
            ? result.update(key, (value) => value + 1)
            : result[key] = 1;
      }
    });

    return result;
  }
}
