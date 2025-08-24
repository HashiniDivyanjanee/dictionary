part of 'word_bloc_bloc.dart';

class WordBlocState extends Equatable {
  final List<Wordentry> words;
  final bool isLoading;

  const WordBlocState({this.words = const [], this.isLoading = false});

  WordBlocState copyWith({
    List<Wordentry>? words, bool? isLoading
  }){
    return WordBlocState(
      words: words ?? this.words,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
 List<Object?> get props => [words, isLoading];
}

