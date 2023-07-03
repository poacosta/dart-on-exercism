class Diamond {
  List<String> rows(String character) {
    var alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
    var index = alphabet.indexOf(character);
    var result = <String>[];
    for (var i = 0; i <= index; i++) {
      var row = List.filled(index * 2 + 1, ' ');
      row[index - i] = alphabet[i];
      row[index + i] = alphabet[i];
      result.add(row.join());
    }
    for (var i = index - 1; i >= 0; i--) result.add(result[i]);
    return result;
  }
}
