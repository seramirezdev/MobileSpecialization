import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var _count = 0;
  final StreamController<Widget> counter = StreamController.broadcast();

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Prueba"),
          ),
          body: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Número de clicks"),
                StreamBuilder(
                  stream: counter.stream,
                  initialData: Container(),
                  builder: (_, snapshop) {
                    return ;
                  },
                ),
                FloatingActionButton.extended(
                  label: Text("Hola"),
                  onPressed: () {
                    counter.close();
                  },
                  icon: Icon(Icons.close),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _count++;
              counter.sink.add(Text("$_count"));
            },
            child: Icon(Icons.add),
          ),
        ),
      );
}
