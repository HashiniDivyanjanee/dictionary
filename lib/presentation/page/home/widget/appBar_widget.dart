
import 'package:flutter/material.dart';

class appBar_widget extends StatelessWidget implements PreferredSizeWidget{
  const appBar_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Korean Dictionary",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.cyan[300],
      actions: [
        IconButton(onPressed: () {
          
        }, icon: Icon(Icons.more_vert,color: Colors.white,))
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
