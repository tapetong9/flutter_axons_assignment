import 'package:axons_flutter/enums/registration_stepper_enum.dart';
import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/extensions/image_extensions.dart';
import 'package:axons_flutter/screens/authenication/widgets/registration_stepper_item.dart';
import 'package:axons_flutter/utils/navigation/navigate_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/button/primary_button.dart';
import '../../widgets/containment/spacer.dart';

class RegistrationStepperScreen extends StatefulWidget {
  const RegistrationStepperScreen({super.key});

  @override
  State<RegistrationStepperScreen> createState() => _RegistrationStepperScreenState();
}

class _RegistrationStepperScreenState extends State<RegistrationStepperScreen> {
  bool _approved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppBar(backgroundColor: Colors.white, title: tr("registration_stepper_page.appbar_title")),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RegistrationStepperItem(status: RegistrationStepperEnum.registered),
                  _buildDivider(true),
                  const RegistrationStepperItem(status: RegistrationStepperEnum.waiting),
                  _buildDivider(false),
                  RegistrationStepperItem(status: _approved ? RegistrationStepperEnum.approved : RegistrationStepperEnum.unapproved),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("registration_waiting_approve.png".assetPath, width: 230),
                      const VSpacer(16),
                      Text(
                        tr("registration_stepper_page.title"),
                        style: context.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const VSpacer(8),
                      Text(
                        tr("registration_stepper_page.subtitle"),
                        style: context.textTheme.bodyMedium?.copyWith(color: Colors.blueGrey.shade600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                PrimaryButton(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  onPressed: _onTapSelfApproveButton,
                  theme: PrimaryButtonTheme.white,
                  showBorder: true,
                  title: "Self Approve",
                ),
                PrimaryButton(
                  margin: const EdgeInsets.all(16.0),
                  icon: const Icon(Icons.arrow_back_ios_new, size: 12),
                  onPressed: _onTapBackButton,
                  title: tr("registration_stepper_page.back_button"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildDivider(bool isHighlight) => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Divider(
            thickness: 1.0,
            color: isHighlight ? Colors.blueGrey.shade300 : null,
          ),
        ),
      );

  void _onTapSelfApproveButton() async {
    await Future.delayed(const Duration(milliseconds: 200));

    setState(() {
      _approved = true;
    });

    Future.delayed(const Duration(milliseconds: 1500)).then(
      (_) {
        NavigateUtil().pop(context);
      },
    );
  }

  void _onTapBackButton() => NavigateUtil().pop(context);
}
