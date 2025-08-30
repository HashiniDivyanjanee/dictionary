import 'package:flutter/material.dart';

class mainWord extends StatelessWidget {
  final String word;
  const mainWord({
    super.key, required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 38,
        color: Colors.white,
      ),
    );
  }
}
