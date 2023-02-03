class Luhn {
  bool valid(String input) {
    final digits = input
        .replaceAll(RegExp(r'\s'), '')
        .split('')
        .map(int.tryParse)
        .toList();
    if (digits.contains(null) || digits.length <= 1) return false;

    for (var i = digits.length - 2; i >= 0; i -= 2) {
      digits[i] = (digits[i]! * 2);
      if (digits[i]! > 9) digits[i] = (digits[i]! - 9);
    }

    return digits.reduce((a, b) => a! + b!)! % 10 == 0;
  }
}
