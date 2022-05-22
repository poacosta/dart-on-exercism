class Hamming {
  final String mustEqual = 'left and right strands must be of equal length';
  final String noEmptyStrand = 'no strand must be empty';

  int distance(String strandA, String strandB) {
    int diff = 0;

    if (strandA.length == strandB.length) {
      for (int i = 0; i < strandA.length; i++)
        if (strandA[i] != strandB[i]) diff++;
    } else {
      throw ArgumentError(
          (strandA.isEmpty || strandB.isEmpty) ? noEmptyStrand : mustEqual);
    }

    return diff;
  }
}
