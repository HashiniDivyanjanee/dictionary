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
      word: json['word']?.toString() ?? '',
      example: json['example']?.toString() ?? '',
      meaning: json['meaning']?.toString() ?? '',
    );
  }

  // Add equality operators for better comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Wordentry &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          example == other.example &&
          meaning == other.meaning;

  @override
  int get hashCode => word.hashCode ^ example.hashCode ^ meaning.hashCode;

  @override
  String toString() {
    return 'Wordentry{word: $word, example: $example, meaning: $meaning}';
  }
}