import 'package:dictionary/app/routes/app_routes.dart';
import 'package:dictionary/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final List<String> bottomNavRoutes = [
      AppRoutes.addWord,
      AppRoutes.home,
      AppRoutes.history,
      AppRoutes.scanner,
    ];

    return BottomNavigationBar(
      selectedItemColor: AppColor.PrimaryColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        context.go(bottomNavRoutes[index]);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Scanner',
        ),
      ],
      currentIndex: 2,
    );
  }
}
