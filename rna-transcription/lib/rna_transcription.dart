class RnaTranscription {
  String toRna(String dna) {
    final Map<String, String> dict = {'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U'};
    return dna.split('').map((e) => dict[e]).join();
  }
}
