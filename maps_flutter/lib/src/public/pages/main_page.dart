import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maps_flutter/src/core/services/local_storage_service.dart';
import 'package:maps_flutter/src/core/services/navigation_service.dart';
import 'package:maps_flutter/src/routes.dart';
// import 'package:qrcode_reader/qrcode_reader.dart';

class MainPage extends StatelessWidget {
  final StreamController<String> _codeController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: onClickBtnLogout,
              child: Text("Cerrar Sesión"),
            ),
          ],
        ),
      ),
    );
  }

  void onClickBtnLogout() async {
    LocalStorageService local = await LocalStorageService.getInstance();
    local.logged = false;
    navigationService.navigateTo(Routes.login, pop: true);
  }
}
