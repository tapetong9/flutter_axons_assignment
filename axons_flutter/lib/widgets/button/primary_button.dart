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
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = (theme == PrimaryButtonTheme.primary) ? Theme.of(context).primaryColor : Colors.white;
    final textColor = (theme == PrimaryButtonTheme.primary) ? Colors.white : Theme.of(context).primaryColor;

    return Container(
      margin: margin,
      width: fitWidth ? null : double.infinity,
      height: height,
      child: FilledButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: showBorder ? Theme.of(context).primaryColor : Colors.transparent,
            ),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
        ),
        child: Text(title),
      ),
    );
  }
}
