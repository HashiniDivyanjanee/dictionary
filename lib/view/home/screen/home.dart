import 'package:dictionary/bloc/word_bloc_bloc.dart';
import 'package:dictionary/model/wordEntry.dart';
import 'package:dictionary/repository/dictionary_repository.dart';
import 'package:dictionary/view/common/widget/bottom_naav_bar.dart';
import 'package:dictionary/view/EnterScreen/Screen/disctionary_screen.dart';
import 'package:dictionary/view/home/widget/appBar_widget.dart';
import 'package:dictionary/view/home/widget/item_card_widget.dart';
import 'package:dictionary/view/home/widget/searchBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final WordBlocBloc wordBloc;

  @override
  void initState() {
    super.initState();
    wordBloc = WordBlocBloc(DictionaryRepository())..add(LoadWords());
  }

  @override
  void dispose() {
    wordBloc.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_widget(),
      body: Column(
        children: [
          SearchBarWidget(),
          ElevatedButton(
            onPressed: () {
              showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8, // Adjust height
            child: BlocProvider(
              create: (_) => WordBlocBloc(DictionaryRepository())..add(LoadWords()),
              child: DictionaryScreen(), // Extract body of DictionaryScreen
            ),
          ),
        );
      },);
            },
            child: Text("Next"),
          ),
          SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<WordBlocBloc, WordBlocState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.words.isEmpty) {
                  return const Center(child: Text("No words added yet."));
                }
                return ListView.builder(
                  itemCount: state.words.length,
                  itemBuilder: (context, index) {
                    Wordentry entry = state.words[index];
                    return ItemCardWidget(
                      title: entry.word,
                      subtitle: entry.example,
                      delete_button: () {
                        context.read<WordBlocBloc>().add(RemoveWord(index));
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
