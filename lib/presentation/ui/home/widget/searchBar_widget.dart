
import 'package:dictionary/bloc/word_bloc_bloc.dart';
import 'package:dictionary/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
 SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(color: AppColor.PrimaryColor),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        child: TextField(
          controller: searchController,
          onChanged: (value) {
            context.read<WordBlocBloc>().add(SearchWord(value));
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.mic),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!),
            ),
          ),
        ),
      ),
    );
  }
}
