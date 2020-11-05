import 'package:flutter/material.dart';

class FundoWidget extends StatelessWidget {
  final Widget widget;

  FundoWidget(this.widget);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('imagens/fundo.jpg'), fit: BoxFit.cover),
        ),
        child: widget);
  }
}
