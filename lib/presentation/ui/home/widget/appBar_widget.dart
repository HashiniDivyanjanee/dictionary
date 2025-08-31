
import 'package:flutter/material.dart';

class appBar_widget extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  const appBar_widget({
    super.key, this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? "Dictionary",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 94, 185, 97),
      actions: [
        IconButton(onPressed: () {
          
        }, icon: Icon(Icons.more_vert,color: Colors.white,))
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
