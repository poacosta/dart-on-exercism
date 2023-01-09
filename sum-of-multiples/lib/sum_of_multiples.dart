class SumOfMultiples {
  int sum(List<int> multiples, int number) {
    if (multiples.isEmpty || (multiples.length == 1 && multiples[0] == 0))
      return 0;

    return Iterable<int>.generate(number, (i) => i)
        .where((i) => multiples.any((m) => m != 0 ? i % m == 0 : false))
        .reduce((a, b) => a + b);
  }
}
