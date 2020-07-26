import 'package:flutter/foundation.dart';

class AppController {

  static final AppController instance = AppController._();

  AppController._();

  final themeDark = ValueNotifier<bool>(false);

  changeTheme(bool value) {
    themeDark.value = value;
  }
}