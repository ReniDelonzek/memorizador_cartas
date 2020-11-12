import 'package:memorizador_cartas/app/api/client_api.dart';
import 'package:memorizador_cartas/app/api/mutations.dart';
import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:memorizador_cartas/app/data/models/db/jogada.dart';
import 'package:memorizador_cartas/app/widgets/seletor_carta/seletor_carta_controller.dart';
import 'package:mobx/mobx.dart';

part 'inserir_cartas_controller.g.dart';

class InserirCartasController = _InserirCartasControllerBase
    with _$InserirCartasController;

abstract class _InserirCartasControllerBase with Store {
  @observable
  ObservableList<Carta> cartas;
  List<SeletorCartaController> controllers = List();
  @observable
  bool finalizado = false;
  Jogada jogada;

  _InserirCartasControllerBase(this.cartas, this.jogada) {
    for (int i = 0; i < cartas.length; i++) {
      SeletorCartaController ctlSeletor = SeletorCartaController(cartas[i]);
      controllers.add(ctlSeletor);
    }
  }

  String verificarDados() {
    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].tipoSelecionado == null) {
        return 'Você precisa selecionar o Tipo da carta ${i + 1}';
      } else if (controllers[i].naipe == null) {
        return 'Você precisa selecionar o Naipe da carta ${i + 1}';
      }
    }
    return null;
  }

  revelarResposta() {
    controllers.forEach((element) {
      element.exibirResposta = true;
    });
    finalizado = true;
  }

  int definirPontuacao(int quantidadeCartas, int tempo) {
    if (controllers.every((element) => element.respostaCorreta())) {
      switch (quantidadeCartas) {
        case 5:
          switch (tempo) {
            case 35:
              return 100;
            case 60:
              return 50;
            case 120:
              return 25;
          }
          break;
        case 10:
          switch (tempo) {
            case 35:
              return 200;
            case 60:
              return 100;
            case 120:
              return 50;
          }
          break;
        case 15:
          switch (tempo) {
            case 35:
              return 300;
            case 60:
              return 150;
            case 120:
              return 75;
          }
          break;
      }
    }
    return 0;
  }

  Future<bool> salvarResultado() async {
    try {
      jogada.pontuacao =
          definirPontuacao(jogada.quantidadeCartas, jogada.tempo);
      var res = await ClientAPI.hasuraConnect
          .mutation(Mutations.cadastroJogada, variables: jogada.toMap());
      return (sucessoMutationAffectRows(res, 'insert_jogada'));
    } catch (error) {
      print(error);
    }
    return false;
  }
}
