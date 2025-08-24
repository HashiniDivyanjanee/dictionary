import 'package:dictionary/presentation/bloc/word_bloc_bloc.dart';
import 'package:dictionary/data/repository/dictionary_repository.dart';
import 'package:dictionary/presentation/page/EnterScreen/Screen/disctionary_screen.dart';
import 'package:dictionary/presentation/page/home/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context)=> WordBlocBloc(DictionaryRepository())..add(LoadWords()),)],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 231, 229, 229)),
        debugShowCheckedModeBanner: false,
        home:  Home(),
      ),
    );
  }
}
