import 'package:dictionary/app/routes/app_routes.dart';
import 'package:dictionary/presentation/ui/addWordScreen/Screen/enter_screen.dart';
import 'package:dictionary/presentation/ui/home/screen/home.dart';
import 'package:dictionary/presentation/ui/wordView/screen/word_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.home,

  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: 'Home',
      builder: (context, state) => Home(),
    ),
    GoRoute(
      path: AppRoutes.addWord,
      name: 'AddWord',
      builder: (context, state) => AddWordScreen(),
    ),
     
  ],
);
