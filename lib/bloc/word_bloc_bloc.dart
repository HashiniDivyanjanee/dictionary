import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'word_bloc_event.dart';
part 'word_bloc_state.dart';

class WordBlocBloc extends Bloc<WordBlocEvent, WordBlocState> {
  WordBlocBloc() : super(WordBlocInitial()) {
    on<WordBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
