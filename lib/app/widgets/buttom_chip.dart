import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memorizador_cartas/app/theme/theme.dart';

class ButtonChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final GestureTapCallback onTap;

  ButtonChip(this.title, this.isSelected, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
            color: isSelected ? getCorPadrao() : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            border: new Border.all(color: Colors.transparent)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white24,
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
              onTap: onTap,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 12, bottom: 12, left: 25, right: 25),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 0.27,
                        color: isSelected ? Colors.white : getCorPadrao()),
                  ),
                ),
              ),
            )));
  }
}
