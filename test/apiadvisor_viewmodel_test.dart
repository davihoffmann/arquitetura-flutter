import 'package:arquitetura_flutter/app/app_module.dart';
import 'package:arquitetura_flutter/app/core/interfaces/client_http_interface.dart';
import 'package:arquitetura_flutter/app/modules/home/home_module.dart';
import 'package:arquitetura_flutter/app/modules/home/models/apiadvisor_model.dart';
import 'package:arquitetura_flutter/app/modules/home/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientHttpMock extends Mock implements ClientHttpInterface {}

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  
  initModule(AppModule(), changeBinds: [
    Bind<ClientHttpInterface>((i) => ClientHttpMock()),
  ]);

  initModule(HomeModule());

  group('ApiAdvisorViewModel', () {
    test('ApiAdvisorViewModel Error', () async {
      when(Modular.get<ClientHttpInterface>().get(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"
      )).thenThrow(Exception("Error"));

      final viewModel = Modular.get<ApiadvisorViewModel>();

      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, null);
    });

    test('ApiAdvisorViewModel Success', () async {
      when(Modular.get<ClientHttpInterface>().get(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"
      )).thenAnswer((_) => Future.value([
        ApiadvisorModel(country: "BR", date: "2020/05/30", text: "Previsão do Tempo").toJson()
      ]));

      final viewModel = Modular.get<ApiadvisorViewModel>();

      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, isA<ApiadvisorModel>());
    });
  });
}
