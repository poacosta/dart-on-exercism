class Forth {
  List<int> _stack = [];

  List<int> get stack => _stack;
  List<String> stackOperations = [
    '+',
    '-',
    '*',
    '/',
    'DUP',
    'DROP',
    'SWAP',
    'OVER'
  ];

  int convert(String input) {
    if (stackOperations.contains(input)) {
      return -1;
    }

    return int.parse(input);
  }

  List<int> evaluate(String input) {
    input.split(' ').forEach((token) {
      _stack.add(convert(token));
    });

    return _stack;
  }
}
