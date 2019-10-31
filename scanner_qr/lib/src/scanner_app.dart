import 'package:flutter/material.dart';
import 'package:scanner_qr/src/home_page.dart';

class ScannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}