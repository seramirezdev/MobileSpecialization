import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  int _contador = 0;

  @override
  Widget build(BuildContext context) {

    print("Dibujando interfaz");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Contador $_contador'),
            RaisedButton(
              child: Text('Ir Home'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              child: Text('Incrementar'),
              onPressed: () {
                _contador++;
                setState(() {
                    
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
