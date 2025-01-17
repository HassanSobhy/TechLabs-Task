import 'package:flutter/material.dart';
import 'package:tech_labs_task/src/presentation/screens/landing/landing_screen.dart';
import 'package:tech_labs_task/src/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:tech_labs_task/src/presentation/screens/profile/profile_screen.dart';
import 'package:tech_labs_task/src/presentation/screens/register/register_screen.dart';
import 'package:tech_labs_task/src/presentation/screens/start/start_screen.dart';

class Routes {
  static const String start = "/";
  static const String onBoarding = "/onBoarding";
  static const String register = "/register";
  static const String landing = "/landing";
  static const String profile = "/profile";
}

class RoutesManager {

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.start:
        return _materialRoute(StartScreen());
      case Routes.onBoarding:
        return _materialRoute(OnBoardingScreen());
      case Routes.register:
        return _materialRoute(RegisterScreen());
      case Routes.landing:
        return _materialRoute(LandingScreen());
      case Routes.profile:
        return _materialRoute(ProfileScreen());
      default:
        return unDefinedRoute(routeSettings.name ?? "");
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> unDefinedRoute(String name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Not found")),
        body: Center(
          child: Text(name),
        ),
      ),
    );
  }
}
