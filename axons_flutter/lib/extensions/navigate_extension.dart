import 'package:axons_flutter/screens/authenication/login_screen.dart';
import 'package:axons_flutter/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../enums/auth_enums.dart';

extension NavigateExtension on AuthStatus {
  Widget get firstScreen {
    switch (this) {
      case AuthStatus.authenticated:
        return const HomeScreen();
      case AuthStatus.guest:
        return const LoginScreen();
      case AuthStatus.unknown:
        break;
    }

    return const LoginScreen();
  }
}
