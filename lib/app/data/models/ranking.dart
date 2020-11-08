import 'dart:convert';

import 'package:memorizador_cartas/app/data/models/db/equipe.dart';

class Ranking {
  int pontuacao;
  Equipe equipe;
  Ranking({
    this.pontuacao,
    this.equipe,
  });

  Ranking copyWith({
    int pontuacao,
    Equipe equipe,
  }) {
    return Ranking(
      pontuacao: pontuacao ?? this.pontuacao,
      equipe: equipe ?? this.equipe,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pontuacao': pontuacao,
      'equipe': equipe?.toMap(),
    };
  }

  factory Ranking.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Ranking(
      pontuacao: map['jogadas_aggregate']['aggregate']['sum']['pontuacao'],
      equipe: Equipe(nome: map['nome']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ranking.fromJson(String source) =>
      Ranking.fromMap(json.decode(source));

  @override
  String toString() => 'Ranking(pontuacao: $pontuacao, equipe: $equipe)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Ranking && o.pontuacao == pontuacao && o.equipe == equipe;
  }

  @override
  int get hashCode => pontuacao.hashCode ^ equipe.hashCode;
}
