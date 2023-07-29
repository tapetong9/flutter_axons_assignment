import 'package:easy_localization/easy_localization.dart';

enum RegistrationStepperEnum {
  registered('assets/images/register_step1-done.png'),
  waiting('assets/images/register_step2-done.png'),
  unapproved('assets/images/register_step3.png'),
  approved('assets/images/register_step3-done.png');

  final String path;
  const RegistrationStepperEnum(this.path);
}

extension RegistrationStepperEnumExtensions on RegistrationStepperEnum {
  String get label {
    switch (this) {
      case RegistrationStepperEnum.registered:
        return tr("registration_stepper_page.stepper.registerd");
      case RegistrationStepperEnum.waiting:
        return tr("registration_stepper_page.stepper.waiting");
      case RegistrationStepperEnum.unapproved:
        return tr("registration_stepper_page.stepper.approved");
      case RegistrationStepperEnum.approved:
        return tr("registration_stepper_page.stepper.approved");
    }
  }
}
