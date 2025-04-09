// lib/routes/app_routes.dart
import 'package:flutter/material.dart';
import 'package:upcpro_app/Presentation/Screens/SetupPage/SetupPage.dart';
import 'package:upcpro_app/Presentation/Screens/SignIn/SignIn.dart';
import 'package:upcpro_app/Presentation/Screens/Splash/splash.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String setup = '/setup';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const SignIn(),
    splash: (context) => const Splash(),
    setup: (context) => const SetupPage(),
  };
}
