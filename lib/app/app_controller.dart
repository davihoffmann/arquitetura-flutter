import 'package:arquitetura_flutter/app/services/app_config_service.dart';
import 'package:arquitetura_flutter/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';

class AppController {

  static final AppController instance = AppController._();

  AppController._() {
    changeThemeViewModel.init();
  }

  final ChangeThemeViewModel changeThemeViewModel = ChangeThemeViewModel(storage: AppConfigService());

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => changeThemeViewModel.config.themeSwitch;
}