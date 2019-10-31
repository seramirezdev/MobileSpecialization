import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class HomePage extends StatelessWidget {

  final StreamController<String> _codeController = StreamController();
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Escanea tu código QR"),
            RaisedButton(
              onPressed: onClickInitScanner,
              child: Text("Escanear!"),
            ),
            RaisedButton(
              onPressed: () {
                contador++;
                _codeController.add("Dato... $contador");
              },
              child: Text("Cambiar datos"),
            ),
            StreamBuilder<String>(
              stream: _codeController.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? snapshot.data : "Cargando...");
              }
            ),
          ],
        ),
      ),
    );
  }

  void onClickInitScanner() async {
    String code;
    try {
      code = await QRCodeReader().scan();

      if (code == null) {
        _codeController.add("No se pudo escanear el código");
        return;
      }

      print(code);

      _codeController.add(code);
    } catch(e) {
      _codeController.add("Ha ocurrido un error");
    }
  }
}