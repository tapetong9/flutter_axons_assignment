import 'package:flutter/material.dart';
import 'env_configs/environment.dart';
import 'package:easy_localization/easy_localization.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  const String flavor = 'dev';
  Environment().initConfig(flavor);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('th', 'TH')],
      startLocale: const Locale('th', 'TH'),
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}
