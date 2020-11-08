import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:memorizador_cartas/app/utils/utils.dart';
import 'package:memorizador_cartas/app/widgets/seletor_carta/seletor_carta_controller.dart';

class SeletorCartaWidget extends StatelessWidget {
  final SeletorCartaController controller;
  const SeletorCartaWidget(this.controller);

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
                      ? (controller.respostaCorreta()
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
                                child: IgnorePointer(
                                    ignoring: controller.exibirResposta,
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
                                                    child: Utils.getImageNaipe(
                                                        value));
                                              }).toList(),
                                            )))))),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: _seletorTipo()),
                  ],
                ),
              ),
            ),
            controller.exibirResposta
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: controller.respostaCorreta()
                        ? Container(
                            child: Icon(Icons.done, color: Colors.white),
                            padding: EdgeInsets.all(16),
                            decoration: new BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                border:
                                    new Border.all(color: Colors.transparent)),
                          )
                        : Text(
                            'Resposta Correta: ${Utils.getStringTipoCarta(controller.resposta.tipo)} de ${Utils.getStringNaipe(controller.resposta.naipe)}',
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
      builder: (_) => IgnorePointer(
        ignoring: controller.exibirResposta,
        child: DropdownButton<Tipo>(
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
      ),
    );
  }
}
