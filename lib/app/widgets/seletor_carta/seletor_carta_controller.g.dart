// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seletor_carta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SeletorCartaController on _SeletorCartaControllerBase, Store {
  final _$tipoSelecionadoAtom =
      Atom(name: '_SeletorCartaControllerBase.tipoSelecionado');

  @override
  Tipo get tipoSelecionado {
    _$tipoSelecionadoAtom.context.enforceReadPolicy(_$tipoSelecionadoAtom);
    _$tipoSelecionadoAtom.reportObserved();
    return super.tipoSelecionado;
  }

  @override
  set tipoSelecionado(Tipo value) {
    _$tipoSelecionadoAtom.context.conditionallyRunInAction(() {
      super.tipoSelecionado = value;
      _$tipoSelecionadoAtom.reportChanged();
    }, _$tipoSelecionadoAtom, name: '${_$tipoSelecionadoAtom.name}_set');
  }

  final _$naipeAtom = Atom(name: '_SeletorCartaControllerBase.naipe');

  @override
  Naipe get naipe {
    _$naipeAtom.context.enforceReadPolicy(_$naipeAtom);
    _$naipeAtom.reportObserved();
    return super.naipe;
  }

  @override
  set naipe(Naipe value) {
    _$naipeAtom.context.conditionallyRunInAction(() {
      super.naipe = value;
      _$naipeAtom.reportChanged();
    }, _$naipeAtom, name: '${_$naipeAtom.name}_set');
  }

  final _$exibirRespostaAtom =
      Atom(name: '_SeletorCartaControllerBase.exibirResposta');

  @override
  bool get exibirResposta {
    _$exibirRespostaAtom.context.enforceReadPolicy(_$exibirRespostaAtom);
    _$exibirRespostaAtom.reportObserved();
    return super.exibirResposta;
  }

  @override
  set exibirResposta(bool value) {
    _$exibirRespostaAtom.context.conditionallyRunInAction(() {
      super.exibirResposta = value;
      _$exibirRespostaAtom.reportChanged();
    }, _$exibirRespostaAtom, name: '${_$exibirRespostaAtom.name}_set');
  }
}
