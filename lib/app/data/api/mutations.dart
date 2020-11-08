class Mutations {
  static const String cadastroEquipe = """
mutation cadastroEquipe(\$nome: String) {
  insert_equipe(objects: {nome: \$nome}) {
    affected_rows
  }
}
  """;

  static const String cadastroJogada = """
mutation cadastroJogada(\$equipe_id: Int, \$pontuacao: Int, \$quantidade_cartas: Int, \$tempo: Int) {
  insert_jogada(objects: {equipe_id: \$equipe_id, pontuacao: \$pontuacao, quantidade_cartas: \$quantidade_cartas, tempo: \$tempo}) {
    affected_rows
  }
}

  """;
}
