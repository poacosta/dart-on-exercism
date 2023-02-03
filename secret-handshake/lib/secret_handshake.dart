class SecretHandshake {
  List<String> commands(int number) {
    var binary = number.toRadixString(2);
    var result = <String>[];

    for (var i = 0; i < binary.length; i++) {
      if (binary[binary.length - i - 1] == '1') {
        switch (i) {
          case 0:
            result.add('wink');
            break;
          case 1:
            result.add('double blink');
            break;
          case 2:
            result.add('close your eyes');
            break;
          case 3:
            result.add('jump');
            break;
          case 4:
            result = result.reversed.toList();
            break;
        }
      }
    }

    return result;
  }
}
