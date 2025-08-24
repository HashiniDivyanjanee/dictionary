import 'package:dictionary/bloc/word_bloc_bloc.dart';
import 'package:dictionary/model/wordEntry.dart';
import 'package:dictionary/view/common/widget/bottom_naav_bar.dart';
import 'package:dictionary/view/home/screen/disctionary_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_widget(),
      body: Column(
        children: [
          SearchBarWidget(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DictionaryScreen(),
                ),
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
