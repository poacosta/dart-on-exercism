class Minesweeper {
  Minesweeper(this.input);

  final List<String> input;

  List<String> get annotated {
    if (input.isEmpty) return [];

    final List<String> board = List<String>.generate(
      input.length,
      (int row) => List<String>.generate(
        input[0].length,
        (int col) => _calculateCell(row, col),
      ).join(),
    );

    return board;
  }

  String _calculateCell(int row, int col) {
    if (input[row][col] == '*') return '*';

    int count = 0;

    for (int i = row - 1; i <= row + 1; i++) {
      for (int j = col - 1; j <= col + 1; j++) {
        if (i >= 0 && i < input.length && j >= 0 && j < input[0].length) {
          if (input[i][j] == '*') count++;
        }
      }
    }

    return count == 0 ? ' ' : count.toString();
  }
}
