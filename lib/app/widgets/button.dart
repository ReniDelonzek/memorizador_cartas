import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  final String title;
  final Function onTap;
  const Button(
    this.title,
    this.onTap, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 150,
      height: 50,
      child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.green,
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
