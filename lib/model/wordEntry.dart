class Wordentry {
  final String word;
  final String example;
  final String meaning;

  Wordentry({required this.word, required this.example, required this.meaning});

  Map<String, dynamic> toJson() => {
    'word': word,
    'example': example,
    'meaning': meaning,
  };

  factory Wordentry.fromJson(Map<String, dynamic> json) {
    return Wordentry(
      word: json['word'],
      example: json['example'],
      meaning: json['meaning'],
    );
  }
}
    