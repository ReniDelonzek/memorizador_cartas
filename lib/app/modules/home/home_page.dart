import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memorizador_cartas/app/modules/home/home_module.dart';
import 'package:memorizador_cartas/app/modules/memorizador/memorizador_module.dart';
import 'package:memorizador_cartas/app/modules/ver_ranking/ver_ranking_module.dart';
import 'package:memorizador_cartas/app/widgets/fundo/fundo_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeModule.to.bloc<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => FundoWidget(
          Form(
            key: _controller.formKey,
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(maxWidth: 300),
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Nome da sua equipe'),
                          maxLength: 6,
                          validator: (text) {
                            if (text.isEmpty) {
                              return 'Insira um nome pra sua equipe';
                            }
                            return null;
                          },
                        ),
                      ),
                      FlatButton(
                          onPressed: () async {
                            String msg = await _controller.verificarDados();
                            if (msg == null) {
                              Get.to(MemorizadorModule());
                            } else if (msg.isNotEmpty) {}
                          },
                          child: Text('Jogar!'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
