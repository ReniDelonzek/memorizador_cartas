import 'package:flutter/material.dart';
import 'package:memorizador_cartas/app/api/client_api.dart';
import 'package:memorizador_cartas/app/api/mutations.dart';
import 'package:memorizador_cartas/app/api/querys.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController ctlNome = TextEditingController();

  Future<String> verificarDados() async {
    if (formKey.currentState.validate()) {
      return null;
    } else {
      return '';
    }
  }

  /// Retorna um int indicando se a equipe ja existe ou nao no banco de dados
  Future<int> equipeJaExiste() async {
    try {
      var res = await ClientAPI.hasuraConnect.query(Querys.equipeExiste,
          variables: {'nome': ctlNome.text.toUpperCase()});
      if (validarRespostaQuery(res, 'equipe', podeSerVazia: false)) {
        return res['data']['equipe'][0]['id'];
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<int> cadastrarEquipe() async {
    try {
      int id = await equipeJaExiste();
      if (id != null) {
        return id;
      }
      var res = await ClientAPI.hasuraConnect.mutation(Mutations.cadastroEquipe,
          variables: {'nome': ctlNome.text.toUpperCase()});
      return (obterIdsResposta(res, 'insert_equipe'))?.first ?? -1;
    } catch (error) {
      print(error);
    }
    return -1;
  }
}
