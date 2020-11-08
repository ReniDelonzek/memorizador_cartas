class Querys {
  static const getRanking = """
  subscription getRanking {
  equipe(order_by: {jogadas_aggregate: {sum: {pontuacao: desc}}}) {
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
}
