import 'package:dictionary/core/constant/appColor.dart';
import 'package:dictionary/presentation/ui/home/widget/appBar_widget.dart';
import 'package:dictionary/presentation/ui/wordView/widget/actionButton.dart';
import 'package:dictionary/presentation/ui/wordView/widget/display_card.dart';
import 'package:dictionary/presentation/ui/wordView/widget/secondTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:share_plus/share_plus.dart';

class WordView extends StatelessWidget {
  final String title;
  final String subtitle;
  final String example;
  const WordView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.example,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_widget(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(color: AppColor.PrimaryColor),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: Colors.white,
                    ),
                  ),
                  secondTitle(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: _build_action_button_row(
                      title: title,
                      subtitle: subtitle,
                      example: example,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          display_card(
            header: 'Meaning',
            meaning: subtitle,
            copy_button: () {
              Clipboard.setData(ClipboardData(text: subtitle));
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Coppied")));
            },
          ),
          SizedBox(height: 15),
          display_card(
            header: 'Description',
            meaning: example,
            fontSize: 16,
            copy_button: () {
              Clipboard.setData(ClipboardData(text: example));
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Coppied")));
            },
          ),
        ],
      ),
    );
  }
}

class _build_action_button_row extends StatelessWidget {
  final String title;
  final String subtitle;
  final String example;
  const _build_action_button_row({
    super.key,
    required this.title,
    required this.subtitle,
    required this.example,
  });

  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildActionButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: title));
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Coppied")));
          },
          icon: Icons.copy,
        ),

        buildActionButton(
          onPressed: () {
            Share.share("Word: $title\nMeaning: $subtitle\nExample: $example");
          },
          icon: Icons.share,
        ),
        buildActionButton(
          onPressed: () async {
            await flutterTts.speak(title);
          },
          icon: Icons.volume_down_sharp,
        ),
      ],
    );
  }
}
