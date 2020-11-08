import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:memorizador_cartas/app/data/models/db/equipe.dart';
import 'package:memorizador_cartas/app/modules/memorizador/memorizador_controller.dart';
import 'package:memorizador_cartas/app/modules/memorizador/memorizador_page.dart';

class MemorizadorModule extends ModuleWidget {
  final Equipe equipe;
  MemorizadorModule(this.equipe);
  @override
  List<Bloc> get blocs => [
        Bloc((i) => MemorizadorController(equipe)),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => MemorizadorPage();

  static Inject get to => Inject<MemorizadorModule>.of();
}
