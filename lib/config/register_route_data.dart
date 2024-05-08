import 'package:flutter/material.dart';
import 'package:my_flutter_structure/config/app_routes.dart';

class RegisterRouteData {
  Route register(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const Text("");
          },
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const Text("");
          },
        );

    }
  }
}