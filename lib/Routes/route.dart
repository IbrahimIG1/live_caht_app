import 'package:flutter/material.dart';
import 'package:voice_chat_room/Routes/app_router.dart';
import 'package:voice_chat_room/screens/home_screen/home_screen.dart';
import 'package:voice_chat_room/screens/login_screen/login.dart';
import 'package:voice_chat_room/screens/signup_screen/sign_up_screen.dart';

class AppRouter {
  Route generateRout(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Text('No Rout Defind For ${settings.name}')),
        );
    }
  }
}
