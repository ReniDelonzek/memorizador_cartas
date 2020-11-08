import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:memorizador_cartas/app/modules/memorizador/inserir_cartas/inserir_cartas_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:memorizador_cartas/app/modules/memorizador/inserir_cartas/inserir_cartas_page.dart';
import 'package:mobx/mobx.dart';

class InserirCartasModule extends ModuleWidget {
  final ObservableList<Carta> cartas;

  InserirCartasModule(this.cartas);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => InserirCartasController(cartas)),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => InserirCartasPage();

  static Inject get to => Inject<InserirCartasModule>.of();
}
