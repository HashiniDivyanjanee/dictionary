import 'package:dictionary/bloc/word_bloc_bloc.dart';
import 'package:dictionary/data/model/wordEntry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePopUpWindow extends StatefulWidget {
  final int index;
  final Wordentry entry;
  const UpdatePopUpWindow({
    super.key,
    required this.index,
    required this.entry,
  });

  @override
  State<UpdatePopUpWindow> createState() => _UpdatePopUpWindowState();
}

class _UpdatePopUpWindowState extends State<UpdatePopUpWindow> {
  late TextEditingController wordController;
  late TextEditingController meaningController;
  late TextEditingController exampleController;

  @override
  void initState() {
    super.initState();
    wordController = TextEditingController(text: widget.entry.word);
    meaningController = TextEditingController(text: widget.entry.meaning);
    exampleController = TextEditingController(text: widget.entry.example);
  }

  @override
  void dispose() {
    wordController.dispose();
    meaningController.dispose();
    exampleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Update Word"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: wordController,
              decoration: InputDecoration(labelText: "Word"),
            ),
            TextField(
              controller: meaningController,
              decoration: InputDecoration(labelText: "Meaning"),
            ),
            TextField(
              controller: exampleController,
              decoration: InputDecoration(labelText: "Example"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
              context.read<WordBlocBloc>().add(
              EditWord(
                widget.index,
                wordController.text,
                exampleController.text,
                meaningController.text,
              ),
            );
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
