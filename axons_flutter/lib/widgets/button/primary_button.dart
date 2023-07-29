import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

enum PrimaryButtonTheme { primary, white }

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double height;
  final bool fitWidth;
  final EdgeInsets margin;
  final bool disabled;
  final bool showBorder;
  final Icon? icon;
  final PrimaryButtonTheme theme;

  const PrimaryButton({
    super.key,
    required this.title,
    this.height = 48.0,
    this.fitWidth = false,
    this.margin = const EdgeInsets.all(0),
    this.disabled = false,
    this.showBorder = false,
    this.theme = PrimaryButtonTheme.primary,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: fitWidth ? null : double.infinity,
      height: height,
      child: _buildButton(context),
    );
  }

  FilledButton _buildButton(BuildContext context) {
    if (icon != null) {
      return FilledButton.icon(
        onPressed: disabled ? null : onPressed,
        style: _buttonStyle(context),
        label: Text(title),
        icon: icon!,
      );
    } else {
      return FilledButton(
        onPressed: disabled ? null : onPressed,
        style: _buttonStyle(context),
        child: Text(title),
      );
    }
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: showBorder ? context.theme.primaryColor : Colors.transparent,
        ),
      ),
      backgroundColor: (theme == PrimaryButtonTheme.primary) ? context.theme.primaryColor : Colors.white,
      foregroundColor: (theme == PrimaryButtonTheme.primary) ? Colors.white : context.theme.primaryColor,
    );
  }
}
