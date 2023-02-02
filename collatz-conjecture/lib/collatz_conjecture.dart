class CollatzConjecture {
  int steps(int n) {
    if (n <= 0) {
      throw ArgumentError('Only positive integers are allowed');
    }
    int steps = 0;
    while (n != 1) {
      if (n % 2 == 0) {
        n = n ~/ 2;
      } else {
        n = 3 * n + 1;
      }
      steps++;
    }
    return steps;
  }
}
