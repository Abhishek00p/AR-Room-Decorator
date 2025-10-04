import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:room_decorator/presentation/pages/ar_view_page.dart';
import 'package:room_decorator/presentation/pages/home_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <GoRoute>[
          GoRoute(
            path: 'ar_view',
            builder: (BuildContext context, GoRouterState state) {
              return const ARViewPage();
            },
          ),
        ],
      ),
    ],
  );
}