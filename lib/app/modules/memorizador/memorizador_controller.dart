import 'dart:math';

import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:memorizador_cartas/app/widgets/selecionar_opcao/selecionar_opcao_controller.dart';
import 'package:mobx/mobx.dart';

part 'memorizador_controller.g.dart';

class MemorizadorController = _MemorizadorControllerBase
    with _$MemorizadorController;

abstract class _MemorizadorControllerBase with Store {
  @observable
  ObservableList<Carta> cartas = ObservableList();
  final SelecionarOpcaoController ctlQuantidade = SelecionarOpcaoController();
  final SelecionarOpcaoController ctlTempo = SelecionarOpcaoController();

  _MemorizadorControllerBase() {
    ctlQuantidade.addItem('5', 1);
    ctlQuantidade.addItem('10', 2);
    ctlQuantidade.addItem('15', 3);

    ctlTempo.addItem('35s', 1);
    ctlTempo.addItem('1min', 2);
    ctlTempo.addItem('2min', 3);
  }

  String verificarDados() {
    if (!ctlQuantidade.options.any((element) => element.isSelected)) {
      return 'Você precisa a quantidade';
    } else if (!ctlTempo.options.any((element) => element.isSelected)) {
      return 'Você precisa o tempo';
    }
    return null;
  }

  List<Carta> sortear(int quantidade) {
    List<Carta> cartas = List();
    for (int i = 0; i < quantidade; i++) {
      cartas.add(Carta(
          tipo: Tipo.values[Random().nextInt(Tipo.values.length)],
          naipe: Naipe.values[Random().nextInt(Naipe.values.length)]));
    }
    this.cartas.clear();
    this.cartas.addAll(cartas);
    return cartas;
  }
}
