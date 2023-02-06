const vowels = ['a', 'e', 'i', 'o', 'u', 'yt', 'xr'];
const consonantClusters = ['ch', 'qu', 'thr', 'th', 'sch'];

String translate(String phrase) {
  var pigLatin = '';
  phrase.split(' ').forEach((element) {
    pigLatin += translateWord(element) + ' ';
  });

  return pigLatin.trim();
}

String translateWord(String phrase) {
  if (phrase.length == 2 && phrase[1] == 'y') return 'y${phrase[0]}ay';
  if (startsWithConsonantsAndY(phrase).length > 0) {
    var partial = startsWithConsonantsAndY(phrase);
    return phrase.substring(partial.length) + partial + 'ay';
  }
  if (startsWithVowel(phrase)) return '${phrase}ay';
  if (startsWithConsonantCluster(phrase).length > 0) {
    var partial = startsWithConsonantCluster(phrase);
    return phrase.substring(partial.length) + partial + 'ay';
  }
  if (startsWithConsonant(phrase)) {
    return (phrase.substring(1, 3) == 'qu')
        ? phrase.substring(3) + phrase[0] + 'quay'
        : phrase.substring(1) + phrase[0] + 'ay';
  }

  return '';
}

bool startsWithVowel(String phrase) {
  for (String vowel in vowels) if (phrase.startsWith(vowel)) return true;

  return false;
}

bool startsWithConsonant(String phrase) => !startsWithVowel(phrase);

String startsWithConsonantCluster(String phrase) {
  for (String consonant in consonantClusters)
    if (phrase.startsWith(consonant)) return consonant;

  return '';
}

String startsWithConsonantsAndY(String phrase) {
  var consonantCluster = <String>[];
  for (String char in phrase.split('')) {
    if (char == 'y') return consonantCluster.join('');
    if (vowels.contains(char)) break;
    consonantCluster.add(char);
  }

  return '';
}
