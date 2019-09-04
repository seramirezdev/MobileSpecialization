import 'package:flutter/material.dart';
import 'package:users_list/src/pages/widgets/button_rounded.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _toolbar(),
          ],
        ),
      ),
    );
  }

  Widget _toolbar() => Material(
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'List Users',
                    style: TextStyle(
                      fontFamily: 'Poppins-SemiBold',
                      fontSize: 24.0,
                    ),
                  ),
                  ButtonRounded(
                    background: Colors.greenAccent[400],
                    icon: Icons.add,
                    onTap: () {
                      print("Click button");
                    },
                  )
                ],
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search user',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    gapPadding: 0,
                    borderSide: BorderSide(color: Colors.greenAccent[400]),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
