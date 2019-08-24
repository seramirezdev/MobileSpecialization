import 'package:flutter/material.dart';
import 'package:trip/src/pages/styles/text_style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size _scrSize;

  @override
  Widget build(BuildContext context) {
    _scrSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundImage(),
          _cardProfile(),
          _body(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: Offset(0, 8),
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.home),
                Text('Inicio'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.explore,
                  color: Colors.grey,
                ),
                Text('Localización', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                Text('Opciones', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return Image.asset(
      'assets/images/back_top.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: _scrSize.height * 0.25,
    );
  }

  Widget _body() {
    final marginTop = _scrSize.height * 0.40;

    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _travelsInfo(
            title: 'Travelling by Car',
            subtitle: '811 Awesome places',
            color: Colors.pink,
            icon: Icons.directions_car,
          ),
          _travelsInfo(
            title: 'Travelling by Bus',
            subtitle: '402 Awesome places',
            color: Colors.orange,
            icon: Icons.directions_bus,
          ),
          _travelsInfo(
            title: 'Travelling by Boat',
            subtitle: '62 Awesome places',
            color: Colors.blue,
            icon: Icons.directions_boat,
          ),
        ],
      ),
    );
  }

  Widget _cardProfile() {
    double marginTop = _scrSize.height * 0.125;
    double marginBottom = _scrSize.height * 0.02;
    double paddingHor = _scrSize.width * 0.15;

    String path = "assets/images/";

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHor),
      child: Container(
        margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
        child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('${path}fondo1.jpg'),
                  ),
                  SizedBox(height: 10.0),
                  Text('Tim Burton', style: textStyleTitle),
                  SizedBox(height: 10.0),
                  Text('Perfect Standart', style: textStyleSubtitle),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('47', style: textStyleNumberProfile),
                          Text(
                            'Message',
                            style: textStyleDescProfile,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('11', style: textStyleNumberProfile),
                          Text(
                            'Video',
                            style: textStyleDescProfile,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget _travelsInfo({title, subtitle, icon, color}) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            leading: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Icon(icon, color: Colors.white),
            ),
            trailing: Icon(Icons.more_vert, color: Colors.black),
          ),
          _listPlaces(),
        ],
      ),
    );
  }

  Widget _listPlaces() {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Card(
            elevation: 0.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset('assets/images/fondo1.jpg'),
          ),
          Card(
            elevation: 0.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset('assets/images/fondo2.jpg'),
          ),
          Card(
            elevation: 0.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset('assets/images/fondo3.jpg'),
          ),
        ],
      ),
    );
  }
}
