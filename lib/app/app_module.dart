import 'package:arquitetura_flutter/app/app_controller.dart';
import 'package:arquitetura_flutter/app/app_widget.dart';
import 'package:arquitetura_flutter/app/core/interfaces/app_config_interface.dart';
import 'package:arquitetura_flutter/app/core/interfaces/client_http_interface.dart';
import 'package:arquitetura_flutter/app/core/services/app_config_service.dart';
import 'package:arquitetura_flutter/app/core/services/client_http_service.dart';
import 'package:arquitetura_flutter/app/core/viewmodels/change_theme_viewmodel.dart';
import 'package:arquitetura_flutter/app/modules/home/home_module.dart';
import 'package:arquitetura_flutter/app/modules/login/login_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
    Bind<ClientHttpInterface>((i) => ClientHttpService()),
    Bind((i) => AppController(i.get()), lazy: false),
    Bind((i) => ChangeThemeViewModel(storage: i.get())),
    Bind<AppConfigInterface>((i) => AppConfigService())
  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
    Router('/', module: LoginModule()),
    Router('/home', module: HomeModule()),
  ];

}