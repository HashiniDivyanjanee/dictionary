// ui/dictionary_screen.dart
import 'package:dictionary/bloc/word_bloc_bloc.dart';
import 'package:dictionary/repository/dictionary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    final TextEditingController wordcontroller = TextEditingController();
    final TextEditingController examplecontroller = TextEditingController();
    final TextEditingController meaningcontroller = TextEditingController();

    return BlocProvider(
      create: (_) => WordBlocBloc(DictionaryRepository())..add(LoadWords()),
      child: Scaffold(
        appBar: AppBar(title: const Text("My Dictionary")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: wordcontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter a word",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (wordcontroller.text.trim().isNotEmpty) {
                        context.read<WordBlocBloc>().add(
                          AddWord(
                            wordcontroller.text.trim(),
                            examplecontroller.text.trim(),
                            meaningcontroller.text.trim(),
                          ),
                        );
                        wordcontroller.clear();
                        examplecontroller.clear();
                        meaningcontroller.clear();
                      }
                    },
                  ),     
                ],
              ),
            ),
  
          ],
        ),
      ),
    );
  }
}
