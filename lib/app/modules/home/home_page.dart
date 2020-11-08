import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:memorizador_cartas/app/modules/home/home_module.dart';
import 'package:memorizador_cartas/app/modules/memorizador/memorizador_module.dart';
import 'package:memorizador_cartas/app/modules/ver_ranking/ver_ranking_module.dart';
import 'package:memorizador_cartas/app/utils/utils.dart';
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
                          textCapitalization: TextCapitalization.characters,
                          controller: _controller.ctlNome,
                          decoration:
                              InputDecoration(labelText: 'Nome da sua equipe'),
                          maxLength: 6,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[A-Z]|[0-9]')),
                          ],
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
                            Get.to(MemorizadorModule());
                            // String msg = await _controller.verificarDados();
                            // if (msg == null) {
                            //   bool sucesso =
                            //       await _controller.cadastrarEquipe();
                            //   if (sucesso) {
                            //     Get.to(MemorizadorModule());
                            //   } else {
                            //     showSnack(
                            //         'Ops, houve uma falha ao cadastrar a equipe');
                            //   }
                            // } else if (msg.isNotEmpty) {
                            //   showSnack(
                            //     msg,
                            //     duration: Duration(seconds: 5),
                            //   );
                            // }
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
