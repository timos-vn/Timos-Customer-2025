import 'package:flutter/material.dart';
import 'package:timos_customer_2025/ui/login/login_screen.dart';
import 'package:timos_customer_2025/ui/main/main_screen.dart';

import '404.dart';

class RouterGenerator {
  static const routeLoginScreen = "/login";
  static const routeMainScreen = "/main";

  static Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case routeLoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeMainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        {
          return MaterialPageRoute(builder: (_) => WidgetNotFound());
        }
    }
  }
}
