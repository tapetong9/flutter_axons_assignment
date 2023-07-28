import 'package:axons_flutter/utils/navigation/navigate_util.dart';
import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/button/primary_button.dart';

class PolicyAndConditionScreen extends StatefulWidget {
  const PolicyAndConditionScreen({super.key});

  @override
  State<PolicyAndConditionScreen> createState() => _PolicyAndConditionScreenState();
}

class _PolicyAndConditionScreenState extends State<PolicyAndConditionScreen> {
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: tr("policy_and_condition_page.title"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade200,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(tr("policy_and_condition_page.detail")),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const VSpacer(4),
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: _accepted,
                            activeColor: const Color.fromRGBO(10, 110, 225, 1.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            onChanged: _onAcceptUpdated,
                          ),
                        ),
                        Text(tr("policy_and_condition_page.accept_button")),
                      ],
                    ),
                    const VSpacer(16),
                    PrimaryButton(
                      disabled: !_accepted,
                      onPressed: _onTapAcceptButton,
                      title: tr("policy_and_condition_page.accept_button"),
                    ),
                    const VSpacer(8),
                    PrimaryButton(
                      onPressed: _onTapCancelButton,
                      title: tr("policy_and_condition_page.cancel_button"),
                      showBorder: true,
                      theme: PrimaryButtonTheme.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAcceptUpdated(v) {
    setState(() {
      _accepted = v!;
    });
  }

  void _onTapAcceptButton() {}

  void _onTapCancelButton() {
    NavigateUtil().pop(context);
  }
}
