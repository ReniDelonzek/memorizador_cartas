import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:memorizador_cartas/app/modules/memorizador/inserir_cartas/inserir_cartas_module.dart';
import 'package:memorizador_cartas/app/modules/memorizador/memorizador_module.dart';
import 'package:memorizador_cartas/app/widgets/button.dart';
import 'package:memorizador_cartas/app/widgets/carta/carta_widget.dart';
import 'package:memorizador_cartas/app/widgets/fundo/fundo_widget.dart';
import 'package:memorizador_cartas/app/widgets/selecionar_opcao/selecionar_opcao_widget.dart';

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
      body: Builder(
          builder: (context) => SingleChildScrollView(
                child: FundoWidget(Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SelecionarOpcaoWidget(_controller.ctlQuantidade,
                        selecaoSimples: true),
                    SelecionarOpcaoWidget(_controller.ctlTempo,
                        selecaoSimples: true),
                    Button(
                      'Jogar',
                      () {
                        _controller.sortear(5);
                        setState(() {});
                        Future.delayed(Duration(seconds: 2)).then((value) =>
                            Get.to(InserirCartasModule(_controller.cartas)));
                      },
                    ),
                    Wrap(
                      children: _controller.cartas
                          .map((element) => CartaWidget(element))
                          .toList(),
                      direction: Axis.horizontal,
                    )
                  ],
                )),
              )),
    );
  }
}
