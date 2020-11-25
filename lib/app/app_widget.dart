import 'package:flutter/material.dart';
import 'package:memorizador_cartas/app/modules/home/home_module.dart';
import 'package:memorizador_cartas/app/theme/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memorizador de Cartas',
      themeMode: ThemeMode.dark,
      theme: Tema.getTema(context, darkMode: true),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: HomeModule(),
    );
  }
}
