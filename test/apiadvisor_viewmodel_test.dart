import 'package:arquitetura_flutter/app/interfaces/client_http_interface.dart';
import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';
import 'package:arquitetura_flutter/app/repositories/apiadvisor_repository.dart';
import 'package:arquitetura_flutter/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ClientHttpMock extends Mock implements ClientHttpInterface {}

main() {
  final mock = ClientHttpMock();

  final viewModel = ApiadvisorViewModel(
    ApiadvisorRepository(
      mock,
    ),
  );

  group('ApiAdvisorViewModel', () {
    test('ApiAdvisorViewModel Error', () async {
      when(mock.get(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"
      )).thenThrow(Exception("Error"));

      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, null);
    });

    test('ApiAdvisorViewModel Success', () async {
      when(mock.get(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"
      )).thenAnswer((_) => Future.value([
        ApiadvisorModel(country: "BR", date: "2020/05/30", text: "Previsão do Tempo").toJson()
      ]));

      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, isA<ApiadvisorModel>());
    });
  });
}
