import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';
import 'package:arquitetura_flutter/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/foundation.dart';

class HomeController {

  final ApiadvisorViewModel apiadvisorViewModel;

  HomeController(this.apiadvisorViewModel);

  ValueNotifier<ApiadvisorModel> get time => apiadvisorViewModel.apiadvisorModel;

  getTime() {
    apiadvisorViewModel.fill();
  }

}