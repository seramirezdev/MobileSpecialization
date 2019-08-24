import 'package:flutter/material.dart';
import 'package:trip/src/pages/home_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trip App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
