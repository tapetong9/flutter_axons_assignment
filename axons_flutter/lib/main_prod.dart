import 'package:flutter/material.dart';
import 'env_configs/environment.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String flavor = 'prod';
  Environment().initConfig(flavor);

  runApp(
    const MyApp(),
  );
}
