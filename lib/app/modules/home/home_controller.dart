import 'package:flutter/material.dart';
import 'package:memorizador_cartas/app/data/api/client_api.dart';
import 'package:memorizador_cartas/app/data/api/mutations.dart';
import 'package:memorizador_cartas/app/data/api/querys.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController ctlNome = TextEditingController();

  Future<String> verificarDados() async {
    if (formKey.currentState.validate()) {
      bool resultado = await equipeJaExiste();
      if (resultado == null) {
        return 'Ops, houve uma falha ao consultar nosso servidor';
      } else {
        if (resultado == true) {
          return 'Ops, parece que já existe uma equipe com esse nome, por favor, escolha outro';
        }
      }
    }
    return null;
  }

  /// Retorna um bool indicando se a equipe ja existe ou nao no banco de dados
  Future<bool> equipeJaExiste() async {
    var res = await ClientAPI.hasuraConnect.query(Querys.equipeExiste,
        variables: {'nome': ctlNome.text.toUpperCase()});
    if (res != null) {
      int count = res["data"]["equipe_aggregate"]["aggregate"]["count"];
      return count > 0;
    } else
      return null;
  }

  Future<bool> cadastrarEquipe() async {
    try {
      var res = await ClientAPI.hasuraConnect.mutation(Mutations.cadastroEquipe,
          variables: {'nome': ctlNome.text.toUpperCase()});
      return (sucessoMutationAffectRows(res, 'insert_equipe'));
    } catch (error) {
      print(error);
    }
    return false;
  }
}
