import 'package:axons_flutter/env_configs/environment.dart';
import 'package:axons_flutter/extensions/color_extention.dart';
import 'package:axons_flutter/screens/authenication/splash_screen.dart';
import 'package:axons_flutter/services/auth_service.dart';
import 'package:axons_flutter/utils/cache/auth_cache_manager.dart';
import 'package:axons_flutter/utils/network/dio_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authenication/auth_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appName = Environment().config?.appName ?? 'Unknow App Name';
    final authBloc = AuthBloc(AuthService(DioManager.instance), AuthCacheManager());

    return BlocProvider<AuthBloc>(
      create: (_) => authBloc,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: appName,
          home: const SplashScreen(),
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: const Color.fromRGBO(7, 78, 159, 1.0),
            primarySwatch: const Color.fromRGBO(7, 78, 159, 1.0).materialColor(),
            fontFamily: 'IBMPlexSansThai',
            textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              bodyLarge: TextStyle(fontSize: 18),
              bodyMedium: TextStyle(fontSize: 16),
              bodySmall: TextStyle(fontSize: 12),
              labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600), // Button
            ),
          )),
    );
  }
}
