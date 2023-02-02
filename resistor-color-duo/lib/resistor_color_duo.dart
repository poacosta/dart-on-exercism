class ResistorColorDuo {
  int value(List<String> colors) =>
      int.parse(colors.take(2).map((color) => _colorCode(color)).join());

  int _colorCode(String color) => [
        'black',
        'brown',
        'red',
        'orange',
        'yellow',
        'green',
        'blue',
        'violet',
        'grey',
        'white'
      ].indexOf(color);
}
