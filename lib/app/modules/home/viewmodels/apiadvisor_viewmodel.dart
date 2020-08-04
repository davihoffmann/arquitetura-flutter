
import 'package:arquitetura_flutter/app/core/interfaces/apiadvisor_interface.dart';
import 'package:arquitetura_flutter/app/modules/home/models/apiadvisor_model.dart';
import 'package:flutter/material.dart';

class ApiadvisorViewModel {

  final ApiAdvisorInterface repository;

  ApiadvisorViewModel(this.repository);

  final apiadvisorModel = ValueNotifier<ApiadvisorModel>(null);

  fill() async {
    try {
      apiadvisorModel.value = await repository.getTime();
    } catch(e) {
      print(e);
    }
  }

}