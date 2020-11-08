// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inserir_cartas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InserirCartasController on _InserirCartasControllerBase, Store {
  final _$cartasAtom = Atom(name: '_InserirCartasControllerBase.cartas');

  @override
  ObservableList<Carta> get cartas {
    _$cartasAtom.context.enforceReadPolicy(_$cartasAtom);
    _$cartasAtom.reportObserved();
    return super.cartas;
  }

  @override
  set cartas(ObservableList<Carta> value) {
    _$cartasAtom.context.conditionallyRunInAction(() {
      super.cartas = value;
      _$cartasAtom.reportChanged();
    }, _$cartasAtom, name: '${_$cartasAtom.name}_set');
  }

  final _$finalizadoAtom =
      Atom(name: '_InserirCartasControllerBase.finalizado');

  @override
  bool get finalizado {
    _$finalizadoAtom.context.enforceReadPolicy(_$finalizadoAtom);
    _$finalizadoAtom.reportObserved();
    return super.finalizado;
  }

  @override
  set finalizado(bool value) {
    _$finalizadoAtom.context.conditionallyRunInAction(() {
      super.finalizado = value;
      _$finalizadoAtom.reportChanged();
    }, _$finalizadoAtom, name: '${_$finalizadoAtom.name}_set');
  }
}
