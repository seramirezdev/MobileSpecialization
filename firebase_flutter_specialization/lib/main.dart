import 'package:firebase_flutter_specialization/src/core/services/push_notifications_service.dart';
import 'package:firebase_flutter_specialization/src/public/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  MainApp() {
    PushNotificationService().initService();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Firebase Flutter",
      home: HomePage(),
    );
  }
}