import 'package:bloc/bloc.dart';
import 'package:dictionary/data/model/wordEntry.dart';
import 'package:dictionary/data/repository/dictionary_repository.dart';
import 'package:equatable/equatable.dart';
part 'word_bloc_event.dart';
part 'word_bloc_state.dart';

class WordBlocBloc extends Bloc<WordBlocEvent, WordBlocState> {
  final DictionaryRepository repository;

  WordBlocBloc(this.repository) : super(const WordBlocState()) {
    on<LoadWords>(_onLoadWords);
    on<AddWord>(_onAddWords);
    on<RemoveWord>(_onRemoveWords);
    on<SearchWord>(_onSearchWord);
  }

  Future<void> _onLoadWords(
    LoadWords event,
    Emitter<WordBlocState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final words = await repository.loadWords();
    emit(state.copyWith(words: words, isLoading: false));
  }

    Future<void> _onAddWords(
      AddWord event, Emitter<WordBlocState> emit) async {
    final updatedWords = List<Wordentry>.from(state.words)
      ..add(Wordentry(word: event.word, example: event.example, meaning: event.meaning));
    await repository.saveWords(updatedWords);
    emit(state.copyWith(words: updatedWords));
  }

  Future<void> _onRemoveWords(
    RemoveWord event,
    Emitter<WordBlocState> emit,
  ) async {
    final updatedWords = List<Wordentry>.from(state.words)..removeAt(event.index);
    await repository.saveWords(updatedWords);
    emit(state.copyWith(words: updatedWords));
  }

 void _onSearchWord(
    SearchWord event,
    Emitter<WordBlocState> emit,
  ) {
    final filtered = state.words
        .where((wordEntry) =>
            wordEntry.word.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    emit(state.copyWith(filteredWords: filtered));
  }
  
}
