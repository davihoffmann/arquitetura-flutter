import 'package:arquitetura_flutter/app/modules/home/models/apiadvisor_model.dart';

abstract class ApiAdvisorInterface {

  Future<ApiadvisorModel> getTime();

}