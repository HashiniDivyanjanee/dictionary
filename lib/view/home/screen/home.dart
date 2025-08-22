import 'package:dictionary/view/home/widget/appBar_widget.dart';
import 'package:dictionary/view/home/widget/item_card_widget.dart';
import 'package:dictionary/view/home/widget/searchBar_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_widget(),
      body: Column(
        children: [
          SearchBarWidget(),
          SizedBox(height: 10),
          ItemCardWidget(title: '고양이', subtitle: 'Cat'),
          ItemCardWidget(title: '개', subtitle: 'Dog'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan[300],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scanner',
          ),
        ],
        currentIndex: 2,
        onTap: (value) {
          
        },
      ),
    );
  }
}
