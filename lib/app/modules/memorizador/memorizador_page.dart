import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:memorizador_cartas/app/data/models/db/jogada.dart';
import 'package:memorizador_cartas/app/modules/memorizador/inserir_cartas/inserir_cartas_module.dart';
import 'package:memorizador_cartas/app/modules/memorizador/memorizador_module.dart';
import 'package:memorizador_cartas/app/utils/utils.dart';
import 'package:memorizador_cartas/app/widgets/button.dart';
import 'package:memorizador_cartas/app/widgets/carta/carta_widget.dart';
import 'package:memorizador_cartas/app/widgets/fundo/fundo_widget.dart';
import 'package:memorizador_cartas/app/widgets/selecionar_opcao/selecionar_opcao_widget.dart';
import 'package:memorizador_cartas/app/widgets/text_title.dart';

import 'memorizador_controller.dart';

class MemorizadorPage extends StatefulWidget {
  final String title;
  const MemorizadorPage({Key key, this.title = "Memorizador"})
      : super(key: key);

  @override
  _MemorizadorPageState createState() => _MemorizadorPageState();
}

class _MemorizadorPageState extends State<MemorizadorPage> {
  final MemorizadorController _controller =
      MemorizadorModule.to.bloc<MemorizadorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FundoWidget(
      Builder(
          builder: (context) => _controller.cartas.isEmpty
              ? Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextTitle('Selecione a quantidade de cartas'),
                        SelecionarOpcaoWidget(_controller.ctlQuantidade,
                            selecaoSimples: true),
                        SizedBox(height: 25),
                        TextTitle('Selecione o tempo para memorização'),
                        SelecionarOpcaoWidget(_controller.ctlTempo,
                            selecaoSimples: true),
                        SizedBox(height: 35),
                        Button(
                          'Jogar',
                          () async {
                            String msg = _controller.verificarDados();
                            if (msg == null) {
                              _controller.sortear(
                                  int.parse(_controller.ctlQuantidade.value));
                              setState(() {});
                              int tempoTotal = _controller.getTempoEmSegundos();
                              for (int i = 0; i < tempoTotal; i++) {
                                _controller.tempoRestante = (tempoTotal - i);
                                await Future.delayed(Duration(seconds: 1));
                              }
                              Get.off(InserirCartasModule(
                                  _controller.cartas,
                                  Jogada(
                                      quantidadeCartas: int.parse(
                                          _controller.ctlQuantidade.value),
                                      tempo: tempoTotal)));
                            } else {
                              showSnack(msg);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: _controller.cartas
                              .map((element) => CartaWidget(element))
                              .toList(),
                          direction: Axis.horizontal,
                        ),
                        Observer(
                            builder: (_) => TextTitle(
                                'Tempo Restante: ${_controller.tempoRestante}s'))
                      ],
                    ),
                  ),
                )),
    ));
  }
}
