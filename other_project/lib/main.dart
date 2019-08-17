import 'package:flutter/material.dart';
import 'package:other_project/pages/home_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mi primera App",
      home: HomaPage(),
    );
  }
}
