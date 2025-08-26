
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(color: Color.fromARGB(255, 94, 185, 97),),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        child: TextField(
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
