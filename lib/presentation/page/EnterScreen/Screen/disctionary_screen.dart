// ui/dictionary_screen.dart
import 'package:dictionary/presentation/bloc/word_bloc_bloc.dart';
import 'package:dictionary/presentation/widget/common/text_field.dart';
import 'package:dictionary/presentation/page/home/widget/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController wordcontroller = TextEditingController();
    final TextEditingController examplecontroller = TextEditingController();
    final TextEditingController meaningcontroller = TextEditingController();

    return Scaffold(
      appBar: appBar_widget(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomTextField(hintText: 'Enter Word', controller: wordcontroller,),
            SizedBox(height: 20),
            CustomTextField(hintText: 'Enter Meaning', controller: meaningcontroller,),
            SizedBox(height: 20),
            CustomTextField(hintText: 'Enter Example', controller: examplecontroller,),
            SizedBox(height: 20),
            ElevatedButton(
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
                  Navigator.of(context).pop(); 
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}