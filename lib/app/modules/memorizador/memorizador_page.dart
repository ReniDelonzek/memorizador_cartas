import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:memorizador_cartas/app/modules/memorizador/memorizador_module.dart';
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SelecionarOpcaoWidget(_controller.ctlQuantidade,
                        selecaoSimples: true),
                    SelecionarOpcaoWidget(_controller.ctlTempo,
                        selecaoSimples: true),
                    RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          _controller.sortear(5);
                          setState(() {});
                        },
                        child: Text('Jogar')),
                    StaggeredGridView.extentBuilder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 15,
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(1),
                        maxCrossAxisExtent: 160,
                        itemCount: _controller.cartas.length,
                        itemBuilder: (_, index) =>
                            CartaWidget(_controller.cartas[index])),
                  ],
                )),
              )),
    );
  }
}
