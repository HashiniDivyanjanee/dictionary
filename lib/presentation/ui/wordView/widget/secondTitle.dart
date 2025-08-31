import 'package:flutter/material.dart';

class secondTitle extends StatelessWidget {
  const secondTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "noun",
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
