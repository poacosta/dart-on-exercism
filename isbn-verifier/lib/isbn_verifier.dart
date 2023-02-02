bool isValid(String isbn) {
  isbn = isbn.replaceAll('-', '');

  if (isbn.length != 10) return false;

  var sum = 0;
  for (var i = 0; i < 9; i++) {
    var c = isbn.codeUnitAt(i);
    if (c < 48 || c > 57) return false;
    sum += (c - 48) * (10 - i);
  }

  var c = isbn.codeUnitAt(9);
  if (c == 88) {
    sum += 10;
  } else if (c < 48 || c > 57) {
    return false;
  } else {
    sum += c - 48;
  }

  return sum % 11 == 0;
}
