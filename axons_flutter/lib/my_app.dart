import 'package:axons_flutter/env_configs/environment.dart';
import 'package:axons_flutter/screens/authenication/splash_screen.dart';
import 'package:axons_flutter/services/auth_service.dart';
import 'package:axons_flutter/utils/cache/auth_cache_manager.dart';
import 'package:axons_flutter/utils/network/dio_manager.dart';
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
        title: appName,
        home: const SplashScreen(),
      ),
    );
  }
}
