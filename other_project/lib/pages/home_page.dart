import 'package:flutter/material.dart';
import 'package:other_project/pages/second_page.dart';

class HomaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Column(
        children: <Widget>[
          rows(context),
          columns(),
          Expanded(child: stack()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "float",
        onPressed: () {},
        child: Image.asset("assets/images/logo.png", height: 40.0),
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

  Widget rows(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (con) => SecondPage()),
            );
          },
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
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Botón 4'),
          onPressed: () {},
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black),
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
          heroTag: "float1",
          backgroundColor: Colors.purple,
          tooltip: "Botón",
          child: Icon(Icons.add),
        )
      ],
    );
  }

  Widget stack() {
    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            bottom: 0,
            child: FlatButton(
              child: Text('Botón 4'),
              onPressed: () {},
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 100,
            height: 100,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text('Botón 5'),
            ),
          ),
          OutlineButton(
            onPressed: () {},
            child: Text('Botón 6'),
            color: Colors.pink,
            borderSide: BorderSide(width: 1, color: Colors.amber),
          ),
          FloatingActionButton(
            heroTag: "float2",
            onPressed: () {},
            mini: false,
            backgroundColor: Colors.purple,
            tooltip: "Botón",
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
