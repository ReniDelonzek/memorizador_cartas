import 'package:mobx/mobx.dart';
import 'package:msk_utils/models/item_select.dart';

part 'selecionar_opcao_controller.g.dart';

class SelecionarOpcaoController = _SelecionarOpcaoControllerBase
    with _$SelecionarOpcaoController;

abstract class _SelecionarOpcaoControllerBase with Store {
  @observable
  ObservableList<ItemSelect> options = ObservableList();
  String get value => options
      .firstWhere((element) => element.isSelected)
      ?.strings
      ?.values
      ?.first;

  setOption(int id) {
    options.firstWhere((element) => element.id == id)?.isSelected = true;
  }

  @action
  void addItem(String option, int id) {
    ItemSelect itemSelect = ItemSelect();
    itemSelect.id = id;
    itemSelect.object = option;
    itemSelect.strings = {'nome': option};
    itemSelect.isSelected = false;

    options.add(itemSelect);
  }
}
