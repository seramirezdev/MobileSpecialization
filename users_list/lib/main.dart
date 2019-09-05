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
        fontFamily: 'Poppins-SemiBold',
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            gapPadding: 5,
            borderSide: BorderSide(color: Colors.greenAccent[400], width: 0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 5,
            borderSide: BorderSide(color: Colors.greenAccent[400], width: 1.5),
            borderRadius: BorderRadius.circular(30),
          ),
          
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
