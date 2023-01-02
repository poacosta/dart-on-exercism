class Forth {
  List<int> _stack = [];

  List<int> get stack => _stack;

  int convert(String input) => int.parse(input);

  List<int> evaluate(String input) {
    input.split(' ').forEach((token) {
      _stack.add(convert(token));
    });

    return _stack;
  }
}
