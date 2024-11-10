import 'package:flutter/material.dart';
import 'package:movie_app/presentation/home/pages/home.dart';
import 'package:movie_app/presentation/navigation_bar/pages/navigation_page.dart';
import '../../../presentation/auth/pages/login/login.dart';
import '../../../presentation/auth/pages/signup/signup.dart';
import '../../../presentation/presentation.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
         case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
        case RoutesName.navigation:
        return MaterialPageRoute(builder: (context) => const NavigationPage());

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No Route Generated"),
              ),
            );
          },
        );
    }
  }
}
