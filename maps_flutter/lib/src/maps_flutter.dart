import 'package:flutter/material.dart';
import 'package:maps_flutter/src/core/services/local_storage_service.dart';
import 'package:maps_flutter/src/routes.dart';

const titleApp = "Maps Flutter";

class MapsFlutter extends StatelessWidget {
  MapsFlutter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocalStorageService>(
      future: LocalStorageService.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final route = snapshot.data.isLogged ? Routes.main : Routes.login;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: titleApp,
          initialRoute: route,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
