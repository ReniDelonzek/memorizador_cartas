class Querys {
  static const getRanking = """
  subscription getRanking {
  equipe(order_by: {jogadas_aggregate: {sum: {pontuacao: desc}}},  where: {jogadas: {pontuacao: {_is_null: false}}}) {
    jogadas_aggregate {
      aggregate {
        sum {
          pontuacao
        }
      }
    }
    nome
  }
}
  """;

  static const equipeExiste = """
query getIdEquipe(\$nome: String) {
  equipe(where: {nome: {_eq: \$nome}}) {
    id
  }
}
  """;
}
