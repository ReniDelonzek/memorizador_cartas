class Mutations {
  static const String cadastroEquipe = """
mutation cadastroEquipe(\$nome: String) {
  insert_equipe(objects: {nome: \$nome}) {
    affected_rows
  }
}
  """;
}
