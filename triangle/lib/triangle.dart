class Triangle {
  bool sidesWithValidLength(double a, double b, double c) =>
      a > 0 && b > 0 && c > 0;

  bool sidesSumValid(double a, double b, double c) =>
      a + b >= c && b + c >= a && a + c >= b;

  bool equilateral(double a, double b, double c) => a == b && b == c && a > 0;

  bool isosceles(double a, double b, double c) =>
      sidesWithValidLength(a, b, c) &&
      (a == b || b == c || a == c) &&
      sidesSumValid(a, b, c);

  bool scalene(double a, double b, double c) =>
      sidesWithValidLength(a, b, c) &&
      (a != b && b != c && a != c) &&
      sidesSumValid(a, b, c);
}
