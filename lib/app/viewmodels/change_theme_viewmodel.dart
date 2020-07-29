import 'package:arquitetura_flutter/app/interfaces/app_config_interface.dart';
import 'package:arquitetura_flutter/app/models/app_config_model.dart';

class ChangeThemeViewModel {

  final AppConfigInterface storage;

  ChangeThemeViewModel({this.storage});

  final AppConfigModel config = AppConfigModel();

  Future init() async {
    await storage.get('isDark').then((value) {
      if(value != null) {
        config.themeSwitch.value = value;
      }
    });
  }

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }

}