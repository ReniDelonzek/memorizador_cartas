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
  query equipeExiste(\$nome: String!) {
  equipe_aggregate(where: {nome: {_eq: \$nome}}) {
    aggregate {
      count
    }
  }
}
  """;
}