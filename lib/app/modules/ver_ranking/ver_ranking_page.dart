import 'package:flutter/material.dart';
import 'package:memorizador_cartas/app/modules/ver_ranking/ver_ranking_module.dart';
import 'package:memorizador_cartas/app/widgets/fundo/fundo_widget.dart';
import 'ver_ranking_controller.dart';

class VerRankingPage extends StatefulWidget {
  final String title;
  const VerRankingPage({Key key, this.title = "VerRanking"}) : super(key: key);

  @override
  _VerRankingPageState createState() => _VerRankingPageState();
}

class _VerRankingPageState extends State<VerRankingPage> {
  final VerRankingController _controller =
      VerRankingModule.to.bloc<VerRankingController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(children: [
        FundoWidget(SizedBox()),
        Center(
          child: Container(
              width: size.width * 0.75,
              child: StreamBuilder(
                stream: _controller.buscarRanking(),
                builder: (_, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snap.hasError) {
                    return Center(child: Text('Falha ao carregar dados'));
                  }
                  _controller.carregarDados(snap.data);
                  return LayoutBuilder(
                    builder: (_, contrainst) => Card(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: contrainst.maxWidth * 0.75),
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Pontuação')),
                            DataColumn(label: Text('Equipe'))
                          ],
                          rows: (_controller.rankingList)
                              .map((e) => DataRow(cells: [
                                    DataCell(Text(e.pontuacao.toString())),
                                    DataCell(Text(e.equipe.nome))
                                  ]))
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
              )),
        )
      ]),
    );
  }
}
