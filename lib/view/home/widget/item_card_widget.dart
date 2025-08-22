import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTapPage;

  const ItemCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTapPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: Icon(Icons.star),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.bookmark),
          onTap: onTapPage,
        ),
      ),
    );
  }
}
