import 'dart:async';
import 'dart:developer';
import 'package:axons_flutter/screens/authenication/policy_and_condition_screen.dart';
import 'package:axons_flutter/utils/navigation/navigate_util.dart';
import 'package:axons_flutter/widgets/appbar/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/validator/form_validator.dart';
import '../../widgets/button/primary_button.dart';
import '../../widgets/containment/spacer.dart';
import '../../widgets/textFormField/text_input_with_label.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({super.key});

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _fnameFocusNode = FocusNode();
  final FocusNode _lnameFocusNode = FocusNode();
  final FocusNode _provinceFocusNode = FocusNode();
  final FocusNode _telFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 300), () {
      _fnameFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppBar(actions: [
        IconButton(onPressed: _onTapInfoButton, icon: const Icon(Icons.info_outline)),
      ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VSpacer(16),
                      Text(tr("register_page.title"), style: Theme.of(context).textTheme.titleLarge),
                      const VSpacer(4),
                      Text(tr("register_page.subtitle"), style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blueGrey.shade600)),
                      const VSpacer(16),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  color: Colors.grey.shade200,
                  child: Column(
                    children: [
                      TextInputWithLabel(
                        focusNode: _fnameFocusNode,
                        label: tr("register_page.fname"),
                        placeholderText: tr("register_page.placeholder.fname"),
                        required: true,
                        validator: FormValidator.required,
                        onEditingComplete: () => _lnameFocusNode.requestFocus(),
                      ),
                      const VSpacer(16),
                      TextInputWithLabel(
                        focusNode: _lnameFocusNode,
                        label: tr("register_page.lname"),
                        placeholderText: tr("register_page.placeholder.lname"),
                        required: true,
                        validator: FormValidator.required,
                        onEditingComplete: () => _provinceFocusNode.requestFocus(),
                      ),
                      const VSpacer(16),
                      TextInputWithLabel(
                        focusNode: _provinceFocusNode,
                        label: tr("register_page.province"),
                        placeholderText: tr("register_page.placeholder.province"),
                        required: true,
                        validator: FormValidator.required,
                        onEditingComplete: () => _telFocusNode.requestFocus(),
                      ),
                      const VSpacer(16),
                      TextInputWithLabel(
                        focusNode: _telFocusNode,
                        label: tr("register_page.tel"),
                        placeholderText: tr("register_page.placeholder.tel"),
                        required: true,
                        validator: FormValidator.required,
                        onEditingComplete: _onTapSubmitButton,
                      ),
                      const VSpacer(24),
                      PrimaryButton(
                        onPressed: _onTapSubmitButton,
                        title: tr("register_page.register_button"),
                      ),
                      const VSpacer(32),
                      Divider(color: Colors.blueGrey.shade200),
                      const VSpacer(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(tr("register_page.or"), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.blueGrey.shade600)),
                          const HSpacer(4),
                          InkWell(
                            onTap: _onTapLogInWithUsernameADButton,
                            child: Text(tr("register_page.login_with_username_button"), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapInfoButton() => log("[_onTapInfoButton]");

  void _onTapLogInWithUsernameADButton() => log("[_onTapLogInWithUsernameADButton]");

  void _onTapSubmitButton() {
    FocusScope.of(context).unfocus();

    // if (_formKey.currentState!.validate()) {}
    NavigateUtil().push(context, to: const PolicyAndConditionScreen());
  }
}
