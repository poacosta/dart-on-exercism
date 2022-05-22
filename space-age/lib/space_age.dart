class SpaceAge {
  final Map<String, double> planets = {
    'Earth': 1.0,
    'Mercury': 0.2408467,
    'Venus': 0.61519726,
    'Mars': 1.8808158,
    'Jupiter': 11.862615,
    'Saturn': 29.447498,
    'Uranus': 84.016846,
    'Neptune': 164.79132
  };

  final int earthYearInSeconds = 31557600;

  double calculateAge(int seconds, double earthYears) =>
      seconds / earthYearInSeconds / earthYears;

  double age({String planet = '', int seconds = 0}) => double.parse(planets.keys
      .fold(0, (p, e) => calculateAge(seconds, planets[planet]!))
      .toStringAsFixed(2));
}
