import 'package:flutter/material.dart';
import 'package:maps_flutter/src/routes.dart';

const titleApp = "Maps Flutter";

class MapsFlutter extends StatelessWidget {
  const MapsFlutter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: titleApp,
      initialRoute: Routes.main,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
