import 'package:flutter/material.dart';
import 'package:maps_flutter/src/core/services/local_storage_service.dart';
import 'package:maps_flutter/src/core/services/navigation_service.dart';
import 'package:maps_flutter/src/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Login Page"),
            RaisedButton(
              onPressed: onClickBtnLogin,
              child: Text("Iniciar Sesión"),
            ),
          ],
        ),
      ),
    );
  }

  void onClickBtnLogin() async {
    LocalStorageService local = await LocalStorageService.getInstance();
    local.logged = true;
    navigationService.navigateTo(Routes.main, pop: true);
  }
}
