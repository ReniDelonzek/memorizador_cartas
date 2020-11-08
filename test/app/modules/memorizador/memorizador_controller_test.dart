import 'package:flutter_test/flutter_test.dart';
import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:memorizador_cartas/app/data/models/db/equipe.dart';
import 'package:memorizador_cartas/app/modules/memorizador/memorizador_controller.dart';

void main() {
  MemorizadorController memorizador = MemorizadorController(Equipe());

  group('MemorizadorController Test', () {
    test('Testar geração de cartas', () {
      List<Carta> cartas = memorizador.sortear(5);
      expect(cartas.length, 5);
    });
  });
}
