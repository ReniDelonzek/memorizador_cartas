import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:memorizador_cartas/app/modules/ver_ranking/ver_ranking_controller.dart';
import 'package:memorizador_cartas/app/modules/ver_ranking/ver_ranking_page.dart';

class VerRankingModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => VerRankingController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => VerRankingPage();

  static Inject get to => Inject<VerRankingModule>.of();
}
