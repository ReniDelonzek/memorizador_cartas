import 'package:hasura_connect/hasura_connect.dart';
import 'package:memorizador_cartas/app/data/api/client_api.dart';
import 'package:memorizador_cartas/app/data/api/querys.dart';
import 'package:memorizador_cartas/app/data/models/ranking.dart';
import 'package:mobx/mobx.dart';

part 'ver_ranking_controller.g.dart';

class VerRankingController = _VerRankingControllerBase
    with _$VerRankingController;

abstract class _VerRankingControllerBase with Store {
  List<Ranking> rankingList = List();
  Snapshot buscarRanking() {
    return ClientAPI.hasuraConnect.subscription(Querys.getRanking);
  }

  carregarDados(Map res) {
    if (validarRespostaQuery(res, 'equipe')) {
      rankingList.clear();
      for (Map map in res['data']['equipe']) {
        rankingList.add(Ranking.fromMap(map));
      }
    }
  }
}
