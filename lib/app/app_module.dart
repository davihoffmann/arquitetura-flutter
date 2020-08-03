import 'package:arquitetura_flutter/app/app_controller.dart';
import 'package:arquitetura_flutter/app/app_widget.dart';
import 'package:arquitetura_flutter/app/interfaces/apiadvisor_interface.dart';
import 'package:arquitetura_flutter/app/interfaces/app_config_interface.dart';
import 'package:arquitetura_flutter/app/interfaces/client_http_interface.dart';
import 'package:arquitetura_flutter/app/pages/home/home_controller.dart';
import 'package:arquitetura_flutter/app/repositories/apiadvisor_repository.dart';
import 'package:arquitetura_flutter/app/services/app_config_service.dart';
import 'package:arquitetura_flutter/app/services/client_http_service.dart';
import 'package:arquitetura_flutter/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:arquitetura_flutter/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
    Bind((i) => HomeController(i.get())),
    Bind((i) => ApiadvisorViewModel(i.get())),
    Bind<ApiAdvisorInterface>((i) => ApiadvisorRepository(i.get())),
    Bind<ClientHttpInterface>((i) => ClientHttpService()),
    Bind((i) => AppController(i.get()), lazy: false),
    Bind((i) => ChangeThemeViewModel(storage: i.get())),
    Bind<AppConfigInterface>((i) => AppConfigService())


  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => null;

}