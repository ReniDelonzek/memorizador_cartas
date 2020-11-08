import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;

  TextTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
