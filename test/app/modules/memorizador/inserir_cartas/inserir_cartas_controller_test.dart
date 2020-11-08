import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:memorizador_cartas/app/modules/memorizador/inserir_cartas/inserir_cartas_controller.dart';
import 'package:memorizador_cartas/app/modules/memorizador/inserir_cartas/inserir_cartas_module.dart';

void main() {
  initModule(InserirCartasModule());

  InserirCartasController inserircartas;

  setUp(() {
    inserircartas = InserirCartasModule.to.get<InserirCartasController>();
  });

  group('InserirCartasController Test', () {
    //  test("First Test", () {
    //    expect(inserircartas, isInstanceOf<InserirCartasController>());
    //  });

    //  test("Set Value", () {
    //    expect(inserircartas.value, equals(0));
    //    inserircartas.increment();
    //    expect(inserircartas.value, equals(1));
    //  });
  });
}
