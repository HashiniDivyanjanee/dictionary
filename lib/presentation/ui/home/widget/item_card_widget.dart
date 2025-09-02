import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTapPage;
  final VoidCallback delete_button;
  final VoidCallback edit_button;

  const ItemCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTapPage,
    required this.delete_button,
    required this.edit_button,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: Icon(Icons.star),
          title: Text(title ?? "No title"),
          subtitle: Text(subtitle ?? "No subtitle"),
          trailing: SizedBox(
            width: 96,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: edit_button, icon: Icon(Icons.edit)),
               
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
