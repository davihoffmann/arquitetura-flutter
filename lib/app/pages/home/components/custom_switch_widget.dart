import 'package:arquitetura_flutter/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomSwitchWidget extends StatelessWidget {
  final AppController controller = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    final AppController controller = Modular.get<AppController>();
    
    return ValueListenableBuilder<bool>(
      valueListenable: controller.themeSwitch,
      builder: (context, isDark, child) {
        return Switch(
          value: isDark,
          onChanged: controller.changeThemeViewModel.changeTheme,
        );
      },
    );
  }
}
