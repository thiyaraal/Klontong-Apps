import 'package:flutter/material.dart';
import 'package:kelontong_app/core/widgets/custom_screen.dart';
import 'package:kelontong_app/features/auth/views/login_screen.dart';
import 'package:kelontong_app/features/home/views/home.dart';
import 'package:kelontong_app/features/home/views/main_screen.dart';

class AppRoutes {
  static const String main = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String detailResto = '/detail_resto';
  static const String search = '/search';
  static const String review = '/review';
  static const String favorite = '/favorite';
  static const String detailProfile = '/detail_profile';
  static const String myOrder = '/my_order';
  static const String changeTheme = '/change_theme';
  static const String helps = '/helps';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.main:
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        final initialIndex = args['initialIndex'] as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => MainScreen(activeScreen: initialIndex),
        );

      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => const NotFoundScreen());
  }
}
