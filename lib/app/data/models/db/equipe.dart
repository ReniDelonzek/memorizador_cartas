import 'dart:convert';

class Equipe {
  int id;
  String nome;
  Equipe({
    this.id,
    this.nome,
  });

  Equipe copyWith({
    int id,
    String nome,
  }) {
    return Equipe(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory Equipe.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Equipe(
      id: map['id'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipe.fromJson(String source) => Equipe.fromMap(json.decode(source));

  @override
  String toString() => 'Equipe(id: $id, nome: $nome)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Equipe && o.id == id && o.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode;
}
