  import 'package:npngv4/app/cadastro/cadastro_page.dart';
import 'package:npngv4/app/dashboard/dashboard_controller.dart';
import 'package:npngv4/app/cadastro/pagina2/pagina2_controller.dart';
import 'package:npngv4/app/cadastro_repository.dart';
import 'package:npngv4/app/cadastro/cadastro_controller.dart';
import 'package:npngv4/app/cadastro/pagina2/pagina2_page.dart';
import 'package:npngv4/app/dashboard/dashboard_page.dart';
import 'package:npngv4/app/splash/splash_controller.dart';
import 'package:npngv4/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:npngv4/app/app_widget.dart';
import 'package:npngv4/app/modules/home/home_module.dart';
import 'package:npngv4/app/splash/splash_module.dart';
import 'package:npngv4/app/modules/home/home_page.dart';
import 'package:npngv4/app/modules/home/home_controller.dart';
import 'package:npngv4/app/splash/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cadastro/pagina2/ultima_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => DashboardController()),
        Bind((i) => CadastroRepository()),
        Bind((i) => CadastroController()),
        Bind((i) => AppController()),
        Bind((i) => SplashController()),
        Bind((i) => HomeController()),
        Bind((i) => Pagina2Controller()),

  ];

  @override
  List<Router> get routers => [
        Router("/", child: (_, args) => SplashPage()),
        Router("/home", child: (_, args) => HomePage()),
        Router("/cadastro/pagina2", child: (_, args) => Pagina2Page()),
        Router("/cadastro/ultima_pagina/:doencaAfs", child: (_, args) => UltimaPage(doencaAfs: args.params['doencaAfs'])),
        Router("/dashboard", child: (_, args) => DashboardPage()),
        Router("/cadastro/", child: (_, args) => CadastroPage()),


  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
