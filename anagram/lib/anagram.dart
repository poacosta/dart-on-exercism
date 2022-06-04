class Anagram {
  String sort(String word) => (word.toLowerCase().split('')..sort()).join();

  List<String> findAnagrams(String word, List<String> candidates) =>
      candidates.where((e) {
        if (e.length == word.length && word.toLowerCase() != e.toLowerCase()) {
          return sort(word) == sort(e);
        }
        return false;
      }).toList();
}
