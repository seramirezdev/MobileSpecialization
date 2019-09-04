import 'package:flutter/material.dart';

class ButtonRounded extends StatelessWidget {
  final Color _background;
  final IconData _icon;
  final Function _onTap;

  ButtonRounded({background = Colors.green, icon = Icons.add, onTap})
      : _background = background,
        _icon = icon,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      splashColor: Colors.white,
      onTap: _onTap,
      child: Container(
        width: 30.0,
        height: 30.0,
        child: Icon(_icon, color: Colors.white),
        decoration: BoxDecoration(
          color: _background,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
              spreadRadius: -2
            )
          ]
        ),
      ),
    );
  }
}
