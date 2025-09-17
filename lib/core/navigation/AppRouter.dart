import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:killqwerty_flutter/screens/bils/ui/BillsScreen.dart';
import 'package:killqwerty_flutter/screens/news/ui/NewsScreen.dart';
import 'package:killqwerty_flutter/screens/training/ui/TrainingScreen.dart';
class AppRouter {
  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      initialLocation: '/news',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
            return Scaffold(
              body: navigationShell,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: navigationShell.currentIndex,
                onTap: (idx) {
                  if (idx == navigationShell.currentIndex) {
                    navigationShell.goBranch(idx, initialLocation: true);
                  } else {
                    navigationShell.goBranch(idx);
                  }
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
                  BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Bills'),
                  BottomNavigationBarItem(icon: Icon(Icons.home_repair_service), label: 'Training'),
                ],
              ),
            );
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/news',
                  builder: (context, state) => const NewsScreen(),
                  // routes: [
                  //   GoRoute(
                  //     path: 'details',
                  //     builder: (context, state) => const DetailsScreen(title: 'Home details'),
                  //   ),
                  // ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/bills',
                  builder: (context, state) => const BillsScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/training',
                  builder: (context, state) => const TrainingScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
