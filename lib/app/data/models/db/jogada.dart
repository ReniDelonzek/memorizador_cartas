import 'dart:convert';

import 'package:memorizador_cartas/app/data/models/db/equipe.dart';

class Jogada {
  Equipe equipe;
  int pontuacao;
  int quantidadeCartas;
  int tempo;
  Jogada({
    this.equipe,
    this.pontuacao,
    this.quantidadeCartas,
    this.tempo,
  });

  Jogada copyWith({
    Equipe equipe,
    int pontuacao,
    int quantidadeCartas,
    int tempo,
  }) {
    return Jogada(
      equipe: equipe ?? this.equipe,
      pontuacao: pontuacao ?? this.pontuacao,
      quantidadeCartas: quantidadeCartas ?? this.quantidadeCartas,
      tempo: tempo ?? this.tempo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'equipe_id': equipe?.id ?? 1,
      'pontuacao': pontuacao,
      'quantidade_cartas': quantidadeCartas,
      'tempo': tempo,
    };
  }

  factory Jogada.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Jogada(
      equipe: Equipe.fromMap(map['equipe']),
      pontuacao: map['pontuacao'],
      quantidadeCartas: map['quantidade_cartas'],
      tempo: map['tempo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Jogada.fromJson(String source) => Jogada.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Jogada(equipe: $equipe, pontuacao: $pontuacao, quantidadeCartas: $quantidadeCartas, tempo: $tempo)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Jogada &&
        o.equipe == equipe &&
        o.pontuacao == pontuacao &&
        o.quantidadeCartas == quantidadeCartas &&
        o.tempo == tempo;
  }

  @override
  int get hashCode {
    return equipe.hashCode ^
        pontuacao.hashCode ^
        quantidadeCartas.hashCode ^
        tempo.hashCode;
  }
}
