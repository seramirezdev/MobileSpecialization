import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/pages/login_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MainApp());
  });
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Test",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
