import 'package:dio_log_sds/dio_log_sds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/login/ui/login_screen.dart';
import 'package:timos_customer_2025/screen/dashboard/dashboard_screen.dart';
import 'package:timos_customer_2025/screen/detail_trip/detail_trip_screen.dart';
import 'package:timos_customer_2025/screen/detail_trip/bloc/detail_trip_bloc.dart';
import 'package:timos_customer_2025/screen/trip/widgets/driver_view.dart';

import '404.dart';

class RouterGenerator {
  static const routeLoginScreen = "/login";
  static const routeDashboardScreen = "/main";
  static const routeTripDetail = "/trip-detail";
  static const routeShowLog = "/show-log";

  static Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case routeLoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeDashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case routeShowLog:
        return MaterialPageRoute(builder: (_) => const HttpLogListWidget());
      // case routeTripDetail:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (_) => DetailTripBloc(),
      //       child: TripDetailScreen(
      //         idLichXeLimousine: settings.arguments as String,
      //         tripSummary: settings.arguments as TripSummary,
      //       ),
      //     ),
      //   );
      default:
        {
          return MaterialPageRoute(builder: (_) => WidgetNotFound());
        }
    }
  }
}
