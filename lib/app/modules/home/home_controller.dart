import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<String> verificarDados() async {
    if (formKey.currentState.validate()) {
    } else {
      return '';
    }
    return null;
  }
}
