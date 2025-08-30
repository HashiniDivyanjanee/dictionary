part of 'word_bloc_bloc.dart';

class WordBlocState extends Equatable {
  final List<Wordentry> words;
  final bool isLoading;
final List<Wordentry> filteredWords;
  const WordBlocState({this.words = const [],this.filteredWords = const [], this.isLoading = false});

  WordBlocState copyWith({
    List<Wordentry>? words,
    List<Wordentry>? filteredWords,
    bool? isLoading,
  }) {
    return WordBlocState(
      words: words ?? this.words,
      filteredWords: filteredWords ?? this.filteredWords,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [words, filteredWords, isLoading];
}