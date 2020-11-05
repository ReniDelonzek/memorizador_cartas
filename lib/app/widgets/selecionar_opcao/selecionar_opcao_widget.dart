import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    return StaggeredGridView.extentBuilder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 5,
        mainAxisSpacing: 15,
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
        maxCrossAxisExtent: 160,
        itemCount: _controller.options.length,
        itemBuilder: (_, index) => Observer(
              //deixa o widget reativo
              builder: (_) => ButtonChip(
                  _controller.options[index].strings.values.first,
                  _controller.options[index].isSelected, () {
                if (selecaoSimples) {
                  _controller.options.forEach((element) {
                    if (element.isSelected == true) {
                      element.isSelected = false;
                    }
                  });
                }
                _controller.options[index].isSelected =
                    !_controller.options[index].isSelected;
                //inverte o valor da selecao
                if (mudancaSelecao != null) {
                  mudancaSelecao(_controller.options[index].isSelected,
                      _controller.options[index].id);
                }
              }),
            ));
  }
}
