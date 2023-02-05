class Diamond {
  List<String> rows(String character) {
    var alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
    var index = alphabet.indexOf(character);
    var result = <String>[];

    for (var i = 0; i <= index; i++) {
      var row = '';
      for (var j = 0; j <= index * 2; j++) {
        if (j == index - i || j == index + i) {
          row += alphabet[i];
        } else if (j > index - i && j < index + i) {
          row += ' ';
        } else {
          row += ' ';
        }
      }
      result.add(row);
    }

    for (var i = index - 1; i >= 0; i--) result.add(result[i]);

    return result;
  }
}
