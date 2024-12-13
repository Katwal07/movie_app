import 'package:flutter/material.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/presentation/home/pages/home.dart';
import 'package:movie_app/presentation/search/pages/search.dart';
import 'package:movie_app/presentation/watch/pages/watch_page.dart';
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
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutesName.watchPage:
        final movieDetails = settings.arguments as MovieEntity;
        return MaterialPageRoute(builder: (context) => WatchPage(movieEntity: movieDetails,));
      case RoutesName.searchPage:
        return MaterialPageRoute(builder: (context) => const SearchPage());
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
