import 'package:hasura_connect/hasura_connect.dart';

class ClientAPI {
  static String url = 'https://trab-rodolfo.herokuapp.com/v1/graphql';

  static HasuraConnect hasuraConnect = HasuraConnect(
    url,
    localStorageDelegate: () => LocalStorageHive(),
  );
}

bool validarRespostaQuery(var res, String chave, {bool podeSerVazia = true}) {
  if (res != null) {
    try {
      if (res is Map) {
        Map map = res;
        if (map.containsKey('data') && map['data'].containsKey(chave)) {
          if (podeSerVazia == false) {
            return map['data'][chave] != null && !(map['data'][chave].isEmpty);
          }
          return true;
        }
      }
    } catch (error, _) {
      //UtilsSentry.reportError(error, stackTrace, data: chave);
    }
  }
  return false;
}

List<int> obterIdsResposta(var res, String chave) {
  try {
    return List<int>.from(
        res['data'][chave]['returning'].map((e) => (e['id'] as int)).toList());
  } catch (error, _) {
    //UtilsSentry.reportError(error, stackTrace);
  }
  return null;
}

bool sucessoMutationAffectRows(var res, String chave) {
  try {
    if (res is Map) {
      return res['data'][chave]['affected_rows'] != 0;
    }
  } catch (error, _) {
    //UtilsSentry.reportError(error, stackTrace);
  }
  return false;
}

dynamic getValorLinha(var res, String chave, String variavel) {
  try {
    if (res is Map) {
      return res['data'][chave][variavel];
    }
  } catch (error, _) {
    //UtilsSentry.reportError(error, stackTrace);
  }
  return null;
}
