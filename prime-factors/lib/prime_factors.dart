import 'dart:math' as math;

class PrimeFactors {
  List<int> factors(int n) {
    List<int> factors = [];
    var number = n.abs();

    for (int index = 2; index <= math.sqrt(number); index++) {
      while (number % index == 0) {
        factors.add(index);
        number = number ~/ index;
      }
    }

    if (number > 1) factors.add(number);

    return factors;
  }
}
