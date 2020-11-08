import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memorizador_cartas/app/widgets/buttom_chip.dart';
import 'package:memorizador_cartas/app/widgets/selecionar_opcao/selecionar_opcao_controller.dart';

typedef OpcaoSelecionada = Function(bool selecionado, int id);

class SelecionarOpcaoWidget extends StatelessWidget {
  final SelecionarOpcaoController _controller;

  /// Indica se permite a seleção de múltiplos murais ou somente um
  final bool selecaoSimples;

  /// Dispara toda vez que um mural é selecionado
  final OpcaoSelecionada mudancaSelecao;
  const SelecionarOpcaoWidget(this._controller,
      {this.selecaoSimples = false, this.mudancaSelecao});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40,
      direction: Axis.horizontal,
      children: _controller.options
          .map((element) => Observer(
                builder: (_) => Container(
                  width: 100,
                  child: ButtonChip(
                      element.strings.values.first, element.isSelected, () {
                    if (selecaoSimples) {
                      _controller.options.forEach((element) {
                        if (element.isSelected == true) {
                          element.isSelected = false;
                        }
                      });
                    }
                    element.isSelected = !element.isSelected;
                    //inverte o valor da selecao
                    if (mudancaSelecao != null) {
                      mudancaSelecao(element.isSelected, element.id);
                    }
                  }),
                ),
              ))
          .toList(),
    );
  }
}
