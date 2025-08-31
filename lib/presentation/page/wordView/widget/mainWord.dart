import 'package:flutter/material.dart';

class mainWord extends StatelessWidget {
  const mainWord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "고양이",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 38,
        color: Colors.white,
      ),
    );
  }
}
