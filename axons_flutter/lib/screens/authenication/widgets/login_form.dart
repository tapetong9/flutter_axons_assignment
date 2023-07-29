import 'dart:developer';
import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/extensions/image_extensions.dart';
import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../utils/validator/form_validator.dart';
import '../../../widgets/button/primary_button.dart';
import '../../../widgets/textFormField/text_input_with_label.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onLogInSuccess;

  const LoginForm({super.key, required this.onLogInSuccess});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocusNode = FocusNode();
  String _email = "Axonstech";
  String _password = "1234567890";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: MediaQuery.of(context).viewInsets.bottom + 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("drag_bar.png".assetPath, width: 44),
            const VSpacer(8),
            Text(tr("login_page.form.title"), style: context.textTheme.titleLarge),
            const VSpacer(16),
            TextInputWithLabel(
              label: tr("login_page.form.username"),
              initialValue: _email,
              validator: FormValidator.username,
              onChanged: (v) => _email = v,
              onEditingComplete: () => _passwordFocusNode.requestFocus(),
            ),
            const VSpacer(16),
            TextInputWithLabel(
              label: tr("login_page.form.password"),
              initialValue: _password,
              autofocus: true,
              obscureText: true,
              focusNode: _passwordFocusNode,
              validator: FormValidator.password,
              onChanged: (v) => _password = v,
              onFieldSubmitted: (_) => _onTapLogInButton(),
            ),
            const VSpacer(8),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: _onTapForgotPasswordButton,
                child: Text(tr("login_page.form.forgot_password"), style: context.textTheme.bodyMedium?.copyWith(color: context.theme.primaryColor)),
              ),
            ),
            const VSpacer(24),
            PrimaryButton(
              onPressed: _onTapLogInButton,
              title: tr("login_page.form.login_button"),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapLogInButton() {
    if (_formKey.currentState!.validate()) {
      widget.onLogInSuccess();
    } else {
      log("Invalid email or password");
    }
  }

  void _onTapForgotPasswordButton() => log('[onTapForgotPasswordButton]');
}
