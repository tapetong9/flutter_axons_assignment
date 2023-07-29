import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/extensions/image_extensions.dart';
import 'package:axons_flutter/screens/authenication/register_screen.dart';
import 'package:axons_flutter/screens/home/home_screen.dart';
import 'package:axons_flutter/utils/navigation/navigate_util.dart';
import 'package:axons_flutter/widgets/button/primary_button.dart';
import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    const backgroundAsset = AssetImage("assets/images/login_bg.jpg");
    const backgroundDecoration = BoxDecoration(image: DecorationImage(image: backgroundAsset, fit: BoxFit.cover));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: backgroundDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("branding_logo_1by1.png".assetPath, width: 120),
              const VSpacer(24),
              Text(
                tr("login_page.title"),
                style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
              const VSpacer(8),
              Text(
                tr("login_page.subtitle"),
                style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const VSpacer(62),
              PrimaryButton(
                onPressed: _onTapLogInButton,
                title: tr("login_page.login_button"),
              ),
              const VSpacer(8),
              PrimaryButton(
                onPressed: _routeToRegistorScreen,
                title: tr("login_page.register_button"),
                theme: PrimaryButtonTheme.white,
              ),
              const VSpacer(62),
              Text(
                tr("login_page.version", args: ['1.5']),
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                tr("login_page.copyright"),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _routeToHomeScreen() => NavigateUtil().push(context, to: const HomeScreen(), type: PushType.clearStack);

  void _routeToRegistorScreen() => NavigateUtil().push(context, to: const RegisterFormScreen());

  void _onTapLogInButton() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      builder: (context) {
        return LoginForm(
          onLogInSuccess: _routeToHomeScreen,
        );
      },
    );
  }
}
