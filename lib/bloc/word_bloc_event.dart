part of 'word_bloc_bloc.dart';

abstract class WordBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadWords extends WordBlocEvent {}

class AddWord extends WordBlocEvent {
  final String word;
  final String example;
  final String meaning;
  AddWord(this.word, this.example, this.meaning);

  @override
  List<Object?> get props => [word];
}

class RemoveWord extends WordBlocEvent {
  final int index;
  RemoveWord(this.index);

  @override
  List<Object?> get props => [index];
}

class EditWord extends WordBlocEvent{
  final int index;
  final String updatedWord;
  final String updatedExample;
  final String updatedMeaning;
  EditWord(this.index, this.updatedWord, this.updatedExample, this.updatedMeaning);
}

class SearchWord extends WordBlocEvent {
  final String query;
 SearchWord(this.query);

  @override
  List<Object?> get props => [query];
}