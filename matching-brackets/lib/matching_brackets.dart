class MatchingBrackets {
  Map<String, String> BRACKETS = {'{': '}', '[': ']', '(': ')'};

  bool isPaired(String input) {
    List<String> stack = [];
    for (String c in input.split('')) {
      if (BRACKETS.containsKey(c)) {
        stack.add(c);
      } else if (BRACKETS.containsValue(c)) {
        if (stack.isEmpty || BRACKETS[stack.last] != c) {
          return false;
        }
        stack.removeLast();
      }
    }
    return stack.isEmpty;
  }
}
