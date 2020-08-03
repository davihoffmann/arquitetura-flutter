import 'package:arquitetura_flutter/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomSwitchWidget extends StatelessWidget {

  final AppController controller = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: controller.isDark,
      onChanged: (value) {
        controller.changeThemeViewModel.changeTheme(value);
      },
    );
  }
}
