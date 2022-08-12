import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/navigation/error_page.dart';
import 'package:flutter_all_in_one/navigation/first_page.dart';
import 'package:flutter_all_in_one/navigation/second_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    // get the arguments while pushing Navigator.namedRoutes()

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const FirstPage(),
        );
      case 'second':
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => SecondPage(args),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          );
        }
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
    }
  }
}
