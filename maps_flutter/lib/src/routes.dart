import 'package:flutter/material.dart';
import 'package:maps_flutter/src/public/pages/maps_page.dart';

class Routes {
  static const main = "main";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (context) => MapsPage());
      default:
        return MaterialPageRoute(
            builder: (context) =>
                Scaffold(body: Center(child: Text("Page not found"))));
    }
  }
}
