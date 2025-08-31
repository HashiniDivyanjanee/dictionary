// ui/dictionary_screen.dart
import 'package:dictionary/app/routes/app_routes.dart';
import 'package:dictionary/bloc/word_bloc_bloc.dart';
import 'package:dictionary/presentation/widget/common/bottom_naav_bar.dart';
import 'package:dictionary/presentation/widget/common/text_field.dart';
import 'package:dictionary/presentation/ui/home/widget/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddWordScreen extends StatelessWidget {
  const AddWordScreen({super.key});

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
            CustomTextField(hintText: 'Enter Word', controller: wordcontroller),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Enter Meaning',
              controller: meaningcontroller,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Enter Example',
              controller: examplecontroller,
            ),
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
                  // AlertDialog(
                  //   title: Text("Success"),
                  //   content: Text("Word Added Successfully"),
                  //   actions: [TextButton(onPressed: () {}, child: Text("Ok"))],
                  // );
                  GoRouter.of(context).pushNamed(AppRoutes.home);
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
