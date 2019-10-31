import 'package:flutter/material.dart';
import 'package:maps_flutter/src/public/pages/login_page.dart';
import 'package:maps_flutter/src/public/pages/main_page.dart';
import 'package:maps_flutter/src/public/pages/maps_page.dart';

class Routes {
  static const maps = "maps";
  static const login = "login";
  static const main = "main";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case maps:
        return MaterialPageRoute(builder: (context) => MapsPage());
      case main:
        String args = settings.arguments;
        return MaterialPageRoute(builder: (context) => MainPage());
      case login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        return MaterialPageRoute(
            builder: (context) =>
                Scaffold(body: Center(child: Text("Page not found"))));
    }
  }
}
