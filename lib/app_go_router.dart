import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:marble/src/features/home/views/home_screen.dart';
import 'package:marble/src/features/main_scaffold.dart';
import 'package:marble/src/features/map/views/map_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();


final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavbar(navigationShell);
      },
      branches: [
        // The route branch for the 1º Tab
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        // The route branch for 2º Tab
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: '/map',
            builder: (context, state) => const MapScreen(),
          ),
        ])
      ],
    ),
  ],
);