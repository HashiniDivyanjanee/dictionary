import 'package:dictionary/view/home/screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 231, 229, 229)),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
