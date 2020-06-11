import 'package:npngv4/app/cadastro/pagina2/pagina2_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Pagina2Controller()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<CadastroModule>.of();
}
