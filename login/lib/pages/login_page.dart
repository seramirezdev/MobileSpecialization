import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Size _scrSize;
  bool _selected = true;

  @override
  Widget build(BuildContext context) {
    _scrSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 20.0,
              right: (-_scrSize.width * 0.3) / 2,
              child: _createCirclesRight(),
            ),
            Positioned(
              bottom: 20.0,
              left: (-_scrSize.width * 0.3) / 2,
              child: _createCircleLeft(),
            ),
            Positioned(
              top: 55.0,
              left: 30.0,
              child: Text('Login',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Positioned(
              bottom: 55.0,
              right: 30.0,
              child: Text('Sign Up',
                  style: TextStyle(
                    fontSize: 36.0,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 10.0,
                        offset: Offset(0, 1),
                      )
                    ],
                    fontWeight: FontWeight.bold,
                  )),
            ),
            _createForm(),
          ],
        ),
      ),
    );
  }

  Widget _createForm() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _createCardInput(),
          _createActions(),
        ],
      ),
    );
  }

  Widget _createCardInput() {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline, color: Colors.blue),
                  labelText: 'Correo electrónico'),
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.blue),
                  labelText: 'Contraseña'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createActions() {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Checkbox(
            value: _selected,
            onChanged: (value) {
              setState(() {
                _selected = value;
              });
            },
          ),
          Text('Recuerdame'),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue, blurRadius: 10.0, spreadRadius: -2)
                ],
                gradient: LinearGradient(
                    colors: [Colors.blue[300], Colors.blue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text(
              'LOGIN',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _createCirclesRight() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _createCircle(true),
        SizedBox(width: _scrSize.width * 0.05),
        _createCircle(false)
      ],
    );
  }

  Widget _createCircleLeft() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _createCircle(false),
        SizedBox(width: _scrSize.width * 0.05),
        _createCircle(true)
      ],
    );
  }

  Widget _createCircle(bool isMini) {
    /*if (isMini) {
      width = 2000;
    } else {
      width = 3000;
    }*/
    double width = (isMini) ? _scrSize.width * 0.1 : _scrSize.width * 0.3;

    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: [Colors.blue[300], Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          boxShadow: [
            BoxShadow(color: Colors.blue, blurRadius: 10.0, spreadRadius: -2),
          ]),
    );
  }
}
