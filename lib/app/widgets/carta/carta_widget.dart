import 'package:flutter/material.dart';
import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:memorizador_cartas/app/utils/utils.dart';
import 'package:memorizador_cartas/app/widgets/carta/carta_controller.dart';

class CartaWidget extends StatelessWidget {
  final CartaController _controller = CartaController();
  final Carta carta;
  CartaWidget(this.carta);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 120,
        height: 190,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                child: Text(Utils.getLetraTipoCarta(carta.tipo),
                    style: TextStyle(fontSize: 22))),
            Center(
                child: Container(
                    height: 120, child: Utils.getImageNaipe(carta.naipe))),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(Utils.getLetraTipoCarta(carta.tipo),
                    style: TextStyle(fontSize: 22))),
          ],
        ),
      ),
    );
  }
}
