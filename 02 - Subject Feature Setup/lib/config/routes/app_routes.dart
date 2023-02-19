import 'package:classy/src/home/presentation/views/main_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );
    }
  }
}
