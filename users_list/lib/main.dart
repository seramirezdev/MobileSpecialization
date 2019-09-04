import 'package:flutter/material.dart';
import 'package:users_list/src/pages/home_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Users List",
      theme: ThemeData(
        primaryColor: Colors.greenAccent[400],
        accentColor: Colors.greenAccent[400],
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}