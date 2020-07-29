import 'package:arquitetura_flutter/app/interfaces/apiadvisor_interface.dart';
import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';
import 'package:flutter/material.dart';

class ApiadvisorViewModel {

  final ApiAdvisorInterface repository;

  ApiadvisorViewModel(this.repository);

  final apiadvisorModel = ValueNotifier<ApiadvisorModel>(null);

  fill() async {
    apiadvisorModel.value = await repository.getTime();
  }

}