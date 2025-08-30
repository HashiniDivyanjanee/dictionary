import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
    final String desc;
  final VoidCallback? onTapPage;
  final VoidCallback delete_button;

  const ItemCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTapPage,
    required this.delete_button, required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: Icon(Icons.star),
          title: Column(
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle),
            Text(desc)
            ],
          ),

          // subtitle: Text(subtitle ?? "No subtitle"),
          trailing: SizedBox(
            width: 96,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
                IconButton(onPressed: delete_button, icon: Icon(Icons.delete)),
              ],
            ),
          ),
          onTap: onTapPage,
        ),
      ),
    );
  }
}
