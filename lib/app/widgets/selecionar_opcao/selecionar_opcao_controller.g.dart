// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selecionar_opcao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelecionarOpcaoController on _SelecionarOpcaoControllerBase, Store {
  final _$optionsAtom = Atom(name: '_SelecionarOpcaoControllerBase.options');

  @override
  ObservableList<ItemSelect> get options {
    _$optionsAtom.context.enforceReadPolicy(_$optionsAtom);
    _$optionsAtom.reportObserved();
    return super.options;
  }

  @override
  set options(ObservableList<ItemSelect> value) {
    _$optionsAtom.context.conditionallyRunInAction(() {
      super.options = value;
      _$optionsAtom.reportChanged();
    }, _$optionsAtom, name: '${_$optionsAtom.name}_set');
  }

  final _$_SelecionarOpcaoControllerBaseActionController =
      ActionController(name: '_SelecionarOpcaoControllerBase');

  @override
  void addItem(String option, int id) {
    final _$actionInfo =
        _$_SelecionarOpcaoControllerBaseActionController.startAction();
    try {
      return super.addItem(option, id);
    } finally {
      _$_SelecionarOpcaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
