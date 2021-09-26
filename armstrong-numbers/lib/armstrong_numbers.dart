import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(int number) {
    String str = number.toString();
    int exp = str.length;
    int sum = 0;

    for (int i = 0; i < exp; i++) {
      sum += pow(int.parse(str[i]), exp).toInt();
    }

    return sum == number;
  }
}
