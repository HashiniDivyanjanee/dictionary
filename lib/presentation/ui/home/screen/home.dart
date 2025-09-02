import 'package:dictionary/bloc/word_bloc_bloc.dart';
import 'package:dictionary/data/model/wordEntry.dart';
import 'package:dictionary/presentation/ui/home/widget/update_popup_window.dart';
import 'package:dictionary/presentation/ui/wordView/screen/word_view.dart';
import 'package:dictionary/presentation/widget/common/bottom_naav_bar.dart';
import 'package:dictionary/presentation/ui/home/widget/appBar_widget.dart';
import 'package:dictionary/presentation/ui/home/widget/item_card_widget.dart';
import 'package:dictionary/presentation/ui/home/widget/searchBar_widget.dart';
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
          // Search Bar
          SearchBarWidget(),

          SizedBox(height: 10),

          // ListTile card
          Expanded(
            child: BlocBuilder<WordBlocBloc, WordBlocState>(
              builder: (context, state) {
                final listToShow =
                    state.filteredWords.isNotEmpty || state.isLoading
                    ? state.filteredWords
                    : state.words;
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.words.isEmpty) {
                  return const Center(child: Text("No words added yet."));
                }
                return ListView.builder(
                  itemCount: listToShow.length,
                  itemBuilder: (context, index) {
                    Wordentry entry = listToShow[index];
                    return ItemCardWidget(
                      title: entry.word,
                      subtitle: entry.meaning,

                      // Delete Icon Button
                      delete_button: () {
                        context.read<WordBlocBloc>().add(RemoveWord(index));
                      },

                      // Edit Icon Button
                      edit_button: () {
                        showDialog(
                          context: context,
                          builder: (_) =>
                              UpdatePopUpWindow(index: index, entry: entry),
                        );
                      },
                      onTapPage: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WordView(
                              title: entry.word,
                              subtitle: entry.meaning,
                              example: entry.example,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
