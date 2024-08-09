import 'package:flutter/material.dart';
import 'package:text_writer/src/core/route/app_route_name.dart';
import 'package:text_writer/src/core/style/colors.dart';
import 'package:text_writer/src/feature/home/presentaton/pages/home_page.dart';
import 'package:text_writer/src/feature/splash/presentation/pages/splash_page.dart';

@immutable
final class AppRouter<T extends Object?> {
  Route<T> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.homePage:
        return MaterialPageRoute<T>(builder: (context) => const HomePage());
        case AppRouteName.splashPage:
        return MaterialPageRoute<T>(builder: (context) => const SplashPagae());
      default:
        return _errorRoute();
    }
  }

  Route<T> _errorRoute() => MaterialPageRoute<T>(
        builder: (context) => Scaffold(
          body: Center(
            child: Text(
              'Error Route',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.black,
                  ),
            ),
          ),
        ),
      );
}
