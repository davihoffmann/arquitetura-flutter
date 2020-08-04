
import 'package:arquitetura_flutter/app/core/interfaces/apiadvisor_interface.dart';
import 'package:arquitetura_flutter/app/modules/home/home_controller.dart';
import 'package:arquitetura_flutter/app/modules/home/home_page.dart';
import 'package:arquitetura_flutter/app/modules/home/repositories/apiadvisor_repository.dart';
import 'package:arquitetura_flutter/app/modules/home/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';


class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController(i.get())),
    Bind((i) => ApiadvisorViewModel(i.get())),
    Bind<ApiAdvisorInterface>((i) => ApiadvisorRepository(i.get())),
  ];

  @override
  List<Router> get routers => [
    Router('/', child: (context, args) => HomePage(args.data)),
  ];
}
