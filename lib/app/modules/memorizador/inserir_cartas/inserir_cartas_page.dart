import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:memorizador_cartas/app/modules/memorizador/inserir_cartas/inserir_cartas_module.dart';
import 'package:memorizador_cartas/app/modules/memorizador/memorizador_module.dart';
import 'package:memorizador_cartas/app/modules/ver_ranking/ver_ranking_module.dart';
import 'package:memorizador_cartas/app/utils/utils.dart';
import 'package:memorizador_cartas/app/widgets/button.dart';
import 'package:memorizador_cartas/app/widgets/fundo/fundo_widget.dart';
import 'package:memorizador_cartas/app/widgets/seletor_carta/seletor_carta_controller.dart';
import 'package:memorizador_cartas/app/widgets/seletor_carta/seletor_carta_widget.dart';
import 'inserir_cartas_controller.dart';

class InserirCartasPage extends StatefulWidget {
  final String title;
  const InserirCartasPage({Key key, this.title = "InserirCartas"})
      : super(key: key);

  @override
  _InserirCartasPageState createState() => _InserirCartasPageState();
}

class _InserirCartasPageState extends State<InserirCartasPage> {
  final InserirCartasController _controller =
      InserirCartasModule.to.bloc<InserirCartasController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FundoWidget(SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: _getCartasSelecao()),
              Observer(
                  builder: (_) => _controller.finalizado
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Button('Jogar novamente', () async {
                              bool sucesso =
                                  await _controller.salvarResultado();
                              if (sucesso) {
                                Get.off(MemorizadorModule());
                              } else {
                                showSnack(
                                    'Ops, houve uma falha ao salvar o resultado');
                              }
                            }),
                            SizedBox(width: 50),
                            Button('Ver Ranking', () async {
                              bool sucesso =
                                  await _controller.salvarResultado();
                              if (sucesso) {
                                Get.off(VerRankingModule());
                              } else {
                                showSnack(
                                    'Ops, houve uma falha ao salvar o resultado');
                              }
                            })
                          ],
                        )
                      : Button(
                          'Validar',
                          () {
                            String msg = _controller.verificarDados();
                            if (msg == null) {
                              _controller.revelarResposta();
                            } else {
                              Get.showSnackbar(GetBar(
                                messageText: Text(
                                  msg,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ));
                            }
                          },
                        ))
            ],
          ),
        ),
      )),
    );
  }

  List<Widget> _getCartasSelecao() {
    List<Widget> widgets = List();
    for (int i = 0; i < _controller.controllers.length; i++) {
      SeletorCartaController seletorCartaController =
          _controller.controllers[i];
      widgets.add(Column(
        children: [
          Text(
            '${i + 1}ª Carta',
            style: TextStyle(color: Colors.white),
          ),
          SeletorCartaWidget(seletorCartaController)
        ],
      ));
    }
    return widgets;
  }
}
