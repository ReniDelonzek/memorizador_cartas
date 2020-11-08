import 'package:flutter/widgets.dart';
import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:mobx/mobx.dart';

part 'carta_controller.g.dart';

class CartaController = _CartaControllerBase with _$CartaController;

abstract class _CartaControllerBase with Store {}
