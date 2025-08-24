import 'package:dictionary/presentation/bloc/word_bloc_bloc.dart';
import 'package:dictionary/data/model/wordEntry.dart';
import 'package:dictionary/data/repository/dictionary_repository.dart';
import 'package:dictionary/presentation/widget/button/bottom_naav_bar.dart';
import 'package:dictionary/presentation/page/EnterScreen/Screen/disctionary_screen.dart';
import 'package:dictionary/presentation/page/home/widget/appBar_widget.dart';
import 'package:dictionary/presentation/page/home/widget/item_card_widget.dart';
import 'package:dictionary/presentation/page/home/widget/searchBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Remove the local bloc instance - use the one from main.dart instead
  
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
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: DictionaryScreen(), // Use the existing bloc from context
                    ),
                  );
                },
              );
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