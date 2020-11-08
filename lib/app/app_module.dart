import 'package:memorizador_cartas/app/widgets/seletor_carta/seletor_carta_controller.dart';
import 'package:memorizador_cartas/app/widgets/carta/carta_controller.dart';
import 'package:memorizador_cartas/app/app_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:memorizador_cartas/app/app_widget.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SeletorCartaController()),
        Bloc((i) => CartaController()),
        Bloc((i) => AppController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}