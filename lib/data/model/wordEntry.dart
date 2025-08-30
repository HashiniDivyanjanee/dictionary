class Wordentry {
  final String word;
  final String description;
  final String meaning;

  Wordentry({required this.word, required this.description, required this.meaning});

  Map<String, dynamic> toJson() => {
    'word': word,
    'description': description,
    'meaning': meaning,
  };

  factory Wordentry.fromJson(Map<String, dynamic> json) {
    return Wordentry(
      word: json['word']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      meaning: json['meaning']?.toString() ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Wordentry &&
          runtimeType == other.runtimeType &&
          word == other.word &&
          description == other.description &&
          meaning == other.meaning;

  @override
  int get hashCode => word.hashCode ^ description.hashCode ^ meaning.hashCode;

  @override
  String toString() {
    return 'Wordentry{word: $word, description: $description, meaning: $meaning}';
  }
}