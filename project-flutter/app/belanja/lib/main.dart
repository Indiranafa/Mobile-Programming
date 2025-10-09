import 'package:flutter/material.dart';
import 'package:belanja/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shopping App',
      routerConfig: AppRouter.router, // Harus pakai AppRouter.router
      debugShowCheckedModeBanner: false,
    );
  }
}