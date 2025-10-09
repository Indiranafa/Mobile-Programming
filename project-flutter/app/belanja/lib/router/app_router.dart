import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:belanja/models/item.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/item',
        builder: (context, state) {
          final item = state.extra as Item?;
          if (item != null) {
            return ItemPage(item: item);
          }
          return HomePage(); // Fallback ke home jika item null
        },
      ),
    ],
  );
}