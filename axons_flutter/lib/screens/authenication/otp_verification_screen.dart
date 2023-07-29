import 'dart:async';

import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/screens/authenication/registration_stepper_screen.dart';
import 'package:axons_flutter/utils/navigation/navigate_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/validator/form_validator.dart';
import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/button/primary_button.dart';
import '../../widgets/containment/spacer.dart';
import '../../widgets/textFormField/text_input_field.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final int _initialDuration = 60;
  Timer? _timer;
  String _inputOtp = "";
  int _countDuration = 0;
  bool _canRequestOtp = true;

  @override
  void initState() {
    super.initState();
    _countDuration = _initialDuration;
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const CustomAppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                tr("otp_verification_page.title"),
                style: context.textTheme.titleLarge,
              ),
              const VSpacer(8.0),
              Text(
                tr("otp_verification_page.subtitle"),
                style: context.textTheme.bodyMedium?.copyWith(color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
              const VSpacer(29.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextInputField(
                      placeholderText: tr("otp_verification_page.placeholder"),
                      autofocus: true,
                      validator: FormValidator.required,
                      onChanged: _onTextUpdated,
                      onFieldSubmitted: (_) => _onTapRequestOtpButton,
                    ),
                  ),
                  const HSpacer(8.0),
                  SizedBox(
                    width: 112,
                    child: PrimaryButton(
                      disabled: !_canRequestOtp,
                      onPressed: _onTapRequestOtpButton,
                      title: tr("otp_verification_page.request_button"),
                    ),
                  ),
                ],
              ),
              const VSpacer(32.0),
              PrimaryButton(
                disabled: _inputOtp.length < 6,
                onPressed: _onTapSubmitButton,
                title: tr("otp_verification_page.confirm_button"),
              ),
              const VSpacer(20.0),
              if (!_canRequestOtp)
                Text(
                  tr("otp_verification_page.countdown_message", args: [_countDuration.toString()]),
                  style: context.textTheme.bodyMedium?.copyWith(color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTextUpdated(v) {
    setState(() {
      _inputOtp = v;
    });
  }

  void _onTapRequestOtpButton() {
    setState(() {
      _canRequestOtp = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_countDuration == 0) {
        setState(() {
          _timer?.cancel();
          _countDuration = _initialDuration;
          _canRequestOtp = true;
        });
      } else {
        setState(() {
          _countDuration -= 1;
        });
      }
    });
  }

  void _onTapSubmitButton() {
    // 1. Validate % verify
    // 2. Route to next screen
    NavigateUtil().push(context, to: const RegistrationStepperScreen());
  }
}
