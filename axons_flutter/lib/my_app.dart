import 'package:flutter/material.dart';

import 'env configs/environment.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String appName = Environment().config?.appName ?? 'App Name Not found';

    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _home(),
    );
  }

  Widget _home() {
    final String appName = Environment().config?.appName ?? 'App Name Not found';

    return Center(
      child: Text(appName),
    );
  }
}
