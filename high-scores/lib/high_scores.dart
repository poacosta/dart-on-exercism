class HighScores {
  final List<int> _scores;

  HighScores(this._scores);

  List<int> get scores => _scores;

  int latest() => _scores.last;

  int personalBest() => _scores.reduce((a, b) => a > b ? a : b);

  List<int> personalTopThree() {
    var numbers = _scores.toList();
    numbers.sort();
    return numbers.reversed.take(3).toList();
  }
}
