// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memorizador_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MemorizadorController on _MemorizadorControllerBase, Store {
  final _$cartasAtom = Atom(name: '_MemorizadorControllerBase.cartas');

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
}
