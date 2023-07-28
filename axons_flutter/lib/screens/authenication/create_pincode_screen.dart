import 'dart:developer';
import 'package:axons_flutter/screens/authenication/otp_verification_screen.dart';
import 'package:axons_flutter/screens/authenication/widgets/pin_code_dot.dart';
import 'package:axons_flutter/utils/navigation/navigate_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/button/numpad_keyboard.dart';
import '../../widgets/containment/spacer.dart';

class CreatePinCodeScreen extends StatefulWidget {
  const CreatePinCodeScreen({super.key});

  @override
  State<CreatePinCodeScreen> createState() => _CreatePinCodeScreenState();
}

class _CreatePinCodeScreenState extends State<CreatePinCodeScreen> {
  List<int> _tmpPincode = [];
  final List<int> _pincode = [];
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const CustomAppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/pin_code_logo.png",
                      height: 150,
                      fit: BoxFit.fitHeight,
                    ),
                    const VSpacer(16.0),
                    Text(
                      _tmpPincode.isNotEmpty ? tr("create_pin_code_page.title_confirm") : tr("create_pin_code_page.title"),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const VSpacer(8.0),
                    if (_errorMessage == null)
                      Text(
                        tr("create_pin_code_page.subtitle"),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                      ),
                    if (_errorMessage != null)
                      Text(
                        tr(_errorMessage!),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    const VSpacer(26.0),
                    PinCodeDot(value: _pincode.length),
                  ],
                ),
              ),
              NumpadKeyboard(onSelected: _onSelected),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelected(value) {
    if (value == -1) {
      if (_pincode.isNotEmpty) {
        setState(() {
          _pincode.removeLast();
        });
      }

      return;
    }

    if (_pincode.length < 4) {
      setState(() {
        _errorMessage = null;
        _pincode.add(value);
      });
    }

    if (_pincode.length == 4) {
      if (_tmpPincode.isEmpty) {
        setState(() {
          _tmpPincode = [..._pincode];
          _pincode.clear();
        });
      } else {
        final isEqual = _tmpPincode.every((element) => _pincode.contains(element));

        if (isEqual) {
          log("Set Pincode success");
          _routeToOtpVerificationScreen();
        } else {
          log("Pincode not matched");
          _errorMessage = tr("create_pin_code_page.error");
        }

        setState(() {
          _tmpPincode.clear();
          _pincode.clear();
        });
      }
    }
  }

  void _routeToOtpVerificationScreen() {
    NavigateUtil().push(context, to: const OtpVerificationScreen(), type: PushType.push);
  }
}
