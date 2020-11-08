import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:memorizador_cartas/app/data/models/db/jogada.dart';

import 'package:memorizador_cartas/app/modules/memorizador/inserir_cartas/inserir_cartas_controller.dart';
import 'package:memorizador_cartas/app/modules/memorizador/inserir_cartas/inserir_cartas_module.dart';
import 'package:mobx/mobx.dart';

void main() {
  group('InserirCartasController Test', () {
    test('Teste pontuacao', () {
      InserirCartasController inserircartas = InserirCartasController(
          ObservableList<Carta>(), Jogada(quantidadeCartas: 5, tempo: 35));
      expect(inserircartas.definirPontuacao(5, 35), 100);
      expect(inserircartas.definirPontuacao(5, 60), 50);
      expect(inserircartas.definirPontuacao(5, 120), 25);

      expect(inserircartas.definirPontuacao(10, 35), 200);
      expect(inserircartas.definirPontuacao(10, 60), 100);
      expect(inserircartas.definirPontuacao(10, 120), 50);

      expect(inserircartas.definirPontuacao(15, 35), 300);
      expect(inserircartas.definirPontuacao(15, 60), 150);
      expect(inserircartas.definirPontuacao(15, 120), 75);
    });
  });
}
