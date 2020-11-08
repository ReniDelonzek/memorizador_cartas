import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:memorizador_cartas/app/modules/ver_ranking/ver_ranking_controller.dart';
import 'package:memorizador_cartas/app/modules/ver_ranking/ver_ranking_module.dart';

void main() {
  initModule(VerRankingModule());

  VerRankingController verranking;

  setUp(() {
    verranking = VerRankingModule.to.get<VerRankingController>();
  });

  group('VerRankingController Test', () {
    //  test("First Test", () {
    //    expect(verranking, isInstanceOf<VerRankingController>());
    //  });

    //  test("Set Value", () {
    //    expect(verranking.value, equals(0));
    //    verranking.increment();
    //    expect(verranking.value, equals(1));
    //  });
  });
}
