import 'package:arquitetura_flutter/app/models/apiadvisor_model.dart';

abstract class ApiAdvisorInterface {

  Future<ApiadvisorModel> getTime();

}