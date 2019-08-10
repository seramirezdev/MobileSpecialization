import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mi primera App",
      home: Scaffold(
        appBar: getAppBar(),
        body: Column(
          children: <Widget>[
            rows(),
            Expanded(child: columns())
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Image.asset("assets/images/logo.png", height: 40.0),
        ),
        
      ),
    );
  }

  Widget getAppBar() {
    Widget title = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/images/icon2.png", height: 40.0),
        SizedBox(width: 10.0),
        Text("Mi Toolbar")
      ],
    );

    return AppBar(
      title: Container(child: Center(child: title)),
      backgroundColor: Colors.indigo[400],
      actions: <Widget>[],
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget rows() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          child: Text('Botón 1'),
          onPressed: () {},
        ),
        RaisedButton(
          onPressed: () {},
          child: Text('Botón 2'),
        ),
        OutlineButton(
          onPressed: () {},
          child: Text('Botón 3'),
        )
      ],
    );
  }

  Widget columns() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          child: Text('Botón 4'),
          onPressed: () {},
        ),
        RaisedButton(
          onPressed: () {},
          color: Colors.blue,
          child: Text('Botón 5'),
        ),
        OutlineButton(
          onPressed: () {},
          child: Text('Botón 6'),
          color: Colors.pink,
          borderSide: BorderSide(width: 1, color: Colors.amber),
        ),
        FloatingActionButton(
          onPressed: () {},
          mini: false,
          backgroundColor: Colors.purple,
          tooltip: "Botón",
          child: Icon(Icons.add),
        )
      ],
    );
  }
}
