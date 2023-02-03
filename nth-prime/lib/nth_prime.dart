import 'dart:math' as math;

class NthPrime {
  bool isPrime(int n) {
    if (n < 2) return false;

    for (int i = 2; i <= math.sqrt(n); i++) {
      if (n % i == 0) return false;
    }

    return true;
  }

  int prime(int n) {
    if (n < 1) throw ArgumentError('There is no zeroth prime');
    int count = 0;
    int lastPrime = 0;

    for (int i = 2; count < n; i++) {
      if (isPrime(i)) {
        count++;
        lastPrime = i;
      }
    }

    return lastPrime;
  }
}
