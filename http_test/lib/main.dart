import 'package:flutter/material.dart';
import 'package:http_test/src/pages/main_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Consumiendo servicio WEB",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}