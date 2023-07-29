import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../enums/registration_stepper_enum.dart';

class RegistrationStepperItem extends StatelessWidget {
  final RegistrationStepperEnum status;

  const RegistrationStepperItem({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(status.path, height: 36.0, width: 36.0),
        Text(
          status.label,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.blueGrey.shade600),
        ),
      ],
    );
  }
}
