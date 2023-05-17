import 'package:flutter/material.dart';
import 'package:currency_converter_app/src/core/widgets/no_internet.dart';
import 'package:currency_converter_app/src/core/widgets/wrong.dart';
import 'package:currency_converter_app/src/features/splash/presentation/pages/splash_screen.dart';

import '../../core/utils/strings_manager.dart';

import '../../features/home/presentation/pages/home_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homeScreen = '/homeScreen';
  static const String errorScreen = '/errorScreen';
  static const String noInternetScreen = '/noInternetScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    Map<String, dynamic> args =
        (settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;

    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => HomeView(
                  args: args,
                ));
      case Routes.errorScreen:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
      case Routes.noInternetScreen:
        return MaterialPageRoute(builder: (_) => const NoInternet());

      default:
        return undefinedRoute();
    }
  }

  static Route undefinedRoute() => MaterialPageRoute(
      builder: (_) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          ));
}
