import 'package:flutter/material.dart';
import 'package:toyo/core/constants/strings.dart';
import 'package:toyo/core/exceptions/route_exception.dart';
import 'package:toyo/presentation/screens/home_screen.dart';
import 'package:toyo/presentation/screens/tution/registration/tutionform1.dart';

class AppRouter {
  static const String home = '/';
  static const String teacherRegistraion = '/teacherReg';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
              //title: Strings.homeScreenTitle,
              ),
        );
      // case teacherRegistraion:
      //   return MaterialPageRoute(
      //     builder: (_) => TutionForm1(),
      //   );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
