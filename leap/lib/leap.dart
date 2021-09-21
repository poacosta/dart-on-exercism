class Leap {
  bool leapYear(int year) {
    return (divisibleBy(year, 4) && !divisibleBy(year, 100)) ||
        divisibleBy(year, 400);
  }

  bool divisibleBy(int dividend, int divisor) {
    return dividend % divisor == 0;
  }
}
