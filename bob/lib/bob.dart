class Bob {
  String response(String question) {
    question = question.trim();

    if (question.isEmpty) return 'Fine. Be that way!';

    bool hasLetters = RegExp(r"[a-zA-Z]").hasMatch(question);
    bool yelling = hasLetters && question.toUpperCase() == question;
    bool asking = question.endsWith('?');

    if (yelling && asking) return "Calm down, I know what I\'m doing!";
    if (yelling) return "Whoa, chill out!";
    if (asking) return "Sure.";

    return 'Whatever.';
  }
}
