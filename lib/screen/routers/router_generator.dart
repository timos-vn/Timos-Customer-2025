import 'package:flutter/material.dart';
import 'package:timos_customer_2025/screen/login/ui/login_screen.dart';
import 'package:timos_customer_2025/screen/dashboard/dashboard_screen.dart';
import 'package:timos_customer_2025/screen/trip/trip_detail_screen.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';

import '404.dart';

class RouterGenerator {
  static const routeLoginScreen = "/login";
  static const routeDashboardScreen = "/main";
  static const routeTripDetail = "/trip-detail";

  static Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case routeLoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeDashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case routeTripDetail:
        final TripSummary trip = settings.arguments as TripSummary;
        return MaterialPageRoute(
          builder: (_) => TripDetailScreen(trip: trip),
        );
      default:
        {
          return MaterialPageRoute(builder: (_) => WidgetNotFound());
        }
    }
  }
}
