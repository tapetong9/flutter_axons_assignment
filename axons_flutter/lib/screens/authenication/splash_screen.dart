import 'dart:async';
import 'package:axons_flutter/extensions/navigate_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/authenication/auth_bloc.dart';
import '../../env_configs/environment.dart';
import '../../utils/navigation/navigate_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AuthBloc authBloc;
  late StreamSubscription authStream;

  @override
  void initState() {
    super.initState();
    authBloc = context.read<AuthBloc>()..add(AppStarted());

    authStream = authBloc.stream.listen((state) {
      final firstScreen = state.status.firstScreen;

      Future.delayed(const Duration(seconds: 2)).then(
        (_) => NavigateUtil().navigate(
          context,
          to: firstScreen,
          replace: true,
        ),
      );
    });
  }

  @override
  void dispose() {
    authStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String appName = Environment().config?.appName ?? 'App Name Not found';

    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FlutterLogo(size: 200),
        ),
      ),
    );
  }
}
