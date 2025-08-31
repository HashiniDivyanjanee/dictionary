import 'package:dictionary/presentation/page/home/widget/appBar_widget.dart';
import 'package:dictionary/presentation/page/wordView/widget/actionButton.dart';
import 'package:dictionary/presentation/page/wordView/widget/display_card.dart';
import 'package:dictionary/presentation/page/wordView/widget/mainWord.dart';
import 'package:dictionary/presentation/page/wordView/widget/secondTitle.dart';
import 'package:flutter/material.dart';

class WordView extends StatefulWidget {
  const WordView({super.key});

  @override
  State<WordView> createState() => _WordViewState();
}

class _WordViewState extends State<WordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_widget(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(color: Color.fromARGB(255, 94, 185, 97)),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  mainWord(),
                  secondTitle(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: _build_action_button_row(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          display_card(header: 'Meaning', meaning: 'Cat'),
          SizedBox(height: 15,),
          display_card(header: 'Description', meaning: '고양이 귀여워요.', fontSize: 16,),
        ],
      ),
    );
  }
}

class _build_action_button_row extends StatelessWidget {
  const _build_action_button_row({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildActionButton(onPressed: () {}, icon: Icons.copy),
        buildActionButton(onPressed: () {}, icon: Icons.bookmark),
        buildActionButton(onPressed: () {}, icon: Icons.share),
        buildActionButton(onPressed: () {}, icon: Icons.volume_down_sharp),
      ],
    );
  }
}
