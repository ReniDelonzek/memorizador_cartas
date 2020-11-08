import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:mobx/mobx.dart';

part 'seletor_carta_controller.g.dart';

class SeletorCartaController = _SeletorCartaControllerBase
    with _$SeletorCartaController;

abstract class _SeletorCartaControllerBase with Store {
  @observable
  Tipo tipoSelecionado;
  @observable
  Naipe naipe;
  @observable
  bool exibirResposta = false;
  Carta resposta;

  _SeletorCartaControllerBase(this.resposta);

  bool respostaCorreta() {
    return tipoSelecionado == resposta.tipo && naipe == resposta.naipe;
  }
}
