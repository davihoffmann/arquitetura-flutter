import 'package:arquitetura_flutter/app/interfaces/app_config_interface.dart';
import 'package:arquitetura_flutter/app/models/app_config_model.dart';
import 'package:arquitetura_flutter/app/services/app_config_service.dart';
import 'package:flutter/material.dart';

class AppController {

  static final AppController instance = AppController._();
  AppController._() {
    storage.get('isDark').then((value) {
      if(value != null) {
        config.themeSwitch.value = value;
      }
    });
  }

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  final AppConfigInterface storage = AppConfigService(); 
  
  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}