import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:memorizador_cartas/app/utils/utils.dart';
import 'package:memorizador_cartas/app/widgets/seletor_carta/seletor_carta_controller.dart';

class SeletorCartaWidget extends StatelessWidget {
  final SeletorCartaController controller;
  final Carta respostaCorreta;
  const SeletorCartaWidget(this.controller, this.respostaCorreta);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.only(bottom: 16),
      child: Observer(
        builder: (_) => Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: controller.exibirResposta
                      ? (controller.respostaCorreta(respostaCorreta)
                          ? BorderSide(color: Colors.green, width: 2.0)
                          : BorderSide(color: Colors.red, width: 2.0))
                      : BorderSide.none),
              child: Container(
                width: 150,
                height: 250,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(alignment: Alignment.topLeft, child: _seletorTipo()),
                    Center(
                        child: Container(
                            height: 130,
                            child: Center(
                                child: Observer(
                                    builder: (_) => DropdownButton<Naipe>(
                                          value: controller.naipe,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          underline: SizedBox(),
                                          onChanged: (Naipe tipo) {
                                            controller.naipe = tipo;
                                          },
                                          items: Naipe.values
                                              .map<DropdownMenuItem<Naipe>>(
                                                  (Naipe value) {
                                            return DropdownMenuItem<Naipe>(
                                                value: value,
                                                child:
                                                    Utils.getImageNaipe(value));
                                          }).toList(),
                                        ))))),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: _seletorTipo()),
                  ],
                ),
              ),
            ),
            controller.exibirResposta &&
                    !controller.respostaCorreta(respostaCorreta)
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Text(
                        'Resposta Correta: ${Utils.getStringTipoCarta(respostaCorreta.tipo)} de ${Utils.getStringNaipe(respostaCorreta.naipe)}',
                        style: TextStyle(color: Colors.white)),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _seletorTipo() {
    return Observer(
      builder: (_) => DropdownButton<Tipo>(
        value: controller.tipoSelecionado,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        underline: SizedBox(),
        onChanged: (Tipo tipo) {
          controller.tipoSelecionado = tipo;
        },
        items: Tipo.values.map<DropdownMenuItem<Tipo>>((Tipo value) {
          return DropdownMenuItem<Tipo>(
            value: value,
            child: Text(Utils.getLetraTipoCarta(value)),
          );
        }).toList(),
      ),
    );
  }
}