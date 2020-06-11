import 'package:mobx/mobx.dart';

part 'pagina2_controller.g.dart';

class Pagina2Controller = _Pagina2ControllerBase with _$Pagina2Controller;

abstract class _Pagina2ControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
