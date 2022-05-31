class Raindrops {
  String convert(int number) {
    String result = '';
    Map<int, String> raindrops = {3: 'Pling', 5: 'Plang', 7: 'Plong'};

    raindrops.forEach((key, value) {
      if (number % key == 0) result += value;
    });

    if (result.isEmpty) result = number.toString();

    return result;
  }
}
