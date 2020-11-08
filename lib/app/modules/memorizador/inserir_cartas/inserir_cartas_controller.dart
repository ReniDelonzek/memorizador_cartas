import 'package:memorizador_cartas/app/data/models/carta.dart';
import 'package:memorizador_cartas/app/widgets/seletor_carta/seletor_carta_controller.dart';
import 'package:mobx/mobx.dart';

part 'inserir_cartas_controller.g.dart';

class InserirCartasController = _InserirCartasControllerBase
    with _$InserirCartasController;

abstract class _InserirCartasControllerBase with Store {
  @observable
  ObservableList<Carta> cartas;
  List<SeletorCartaController> controllers = List();
  @observable
  bool finalizado = false;

  _InserirCartasControllerBase(this.cartas);

  String verificarDados() {
    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].tipoSelecionado == null) {
        return 'Você precisa selecionar o Tipo da carta ${i + 1}';
      } else if (controllers[i].naipe == null) {
        return 'Você precisa selecionar o Naipe da carta ${i + 1}';
      }
    }
    return null;
  }

  revelarResposta() {
    controllers.forEach((element) {
      element.exibirResposta = true;
    });
    finalizado = true;
  }
}
