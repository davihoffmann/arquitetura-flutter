import 'package:arquitetura_flutter/app/models/app_config_model.dart';
import 'package:flutter/material.dart';

class AppController {

  static final AppController instance = AppController._();

  AppController._();

  // final themeDark = ValueNotifier<bool>(false);
  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;
  
  changeTheme(bool value) {
    config.themeSwitch.value = value;
  }
}