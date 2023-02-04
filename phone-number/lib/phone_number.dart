class PhoneNumber {
  String clean(String number) {
    final digits = number.replaceAll(RegExp(r'\D'), '');

    if (digits.length > 11)
      throw FormatException('more than 11 digits');
    else if (number.contains(RegExp(r'[a-zA-Z]')))
      throw FormatException('letters not permitted');
    else if (number.contains(RegExp(r'[!@#\$%\^&\*]')))
      throw FormatException('punctuations not permitted');
    else if (digits.length < 10)
      throw FormatException('incorrect number of digits');

    if (digits.length == 11) {
      if (!digits.startsWith('1'))
        throw FormatException('11 digits must start with 1');
      else if (digits[1] == '0')
        throw FormatException('area code cannot start with zero');
      else if (digits[1] == '1')
        throw FormatException('area code cannot start with one');
      else if (digits[4] == '1')
        throw FormatException('exchange code cannot start with one');
      else if (digits[4] == '0')
        throw FormatException('exchange code cannot start with zero');
      else
        return digits.substring(1);
    }

    if (digits.startsWith('0'))
      throw FormatException('area code cannot start with zero');
    else if (digits.startsWith('1'))
      throw FormatException('area code cannot start with one');
    else if (digits[3] == '1')
      throw FormatException('exchange code cannot start with one');
    else if (digits[3] == '0')
      throw FormatException('exchange code cannot start with zero');

    return digits;
  }
}
