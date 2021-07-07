import 'dart:math';

class RandowBible {
  final List<String> listBook = [
    'Genesis',
    'Exodus',
    'Leviticus',
    'Numbers',
    'Deuteronomy',
    'Joshua',
    'Judges',
    'Job',
    'Psalms',
    'Proverbs',
    'Isaiah',
    'Jeremiah',
    'Ezekiel',
    'Daniel',
    'Matthew',
    'Mark',
    'Luke',
    'John',
    'Acts',
    'Romans',
    '1Corinthians',
    '2Corinthians',
    'Galatians',
    'Ephesians',
    'Philippians',
    'Colossians',
    '1Thessalonians',
    '2Thessalonians',
    '1Timothy',
    '2Timothy',
    'Titus',
    'Philemon',
    'Hebrews',
    'James',
    '1Peter',
    '2 Peter',
    '1 John',
    '2 John',
    '3 John',
    'Jude',
    'Revelation'
  ];

  String randomBook() {
    final _random = new Random();
    var element = listBook[_random.nextInt(listBook.length)];

    return element;
  }

  String randomChapter() {
    Random random = new Random();
    int numberRamdom = random.nextInt(40);

    return numberRamdom.toString();
  }

  String randomVersicule() {
    Random random = new Random();
    int numberRamdom = random.nextInt(60);

    return numberRamdom.toString();
  }
}
