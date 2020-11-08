import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:memorizador_cartas/app/widgets/seletor_carta/seletor_carta_controller.dart';
import 'package:memorizador_cartas/app/app_module.dart';

void main() {
  initModule(AppModule());

  SeletorCartaController seletorcarta;

  setUp(() {
    seletorcarta = AppModule.to.get<SeletorCartaController>();
  });

  group('SeletorCartaController Test', () {
    //  test("First Test", () {
    //    expect(seletorcarta, isInstanceOf<SeletorCartaController>());
    //  });

    //  test("Set Value", () {
    //    expect(seletorcarta.value, equals(0));
    //    seletorcarta.increment();
    //    expect(seletorcarta.value, equals(1));
    //  });
  });
}
