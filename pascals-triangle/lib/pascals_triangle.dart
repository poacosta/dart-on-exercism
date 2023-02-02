class PascalsTriangle {
  List<List<int>> rows(int n) {
    List<List<int>> result = [];
    for (int i = 0; i < n; i++) {
      List<int> row = [];
      for (int j = 0; j <= i; j++) {
        if (j == 0 || j == i) {
          row.add(1);
        } else {
          row.add(result[i - 1][j - 1] + result[i - 1][j]);
        }
      }
      result.add(row);
    }
    return result;
  }
}
