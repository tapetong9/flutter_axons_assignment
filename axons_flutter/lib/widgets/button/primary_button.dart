import 'package:flutter/material.dart';

enum PrimaryButtonTheme { primary, white }

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double height;
  final bool fitWidth;
  final EdgeInsets margin;
  final PrimaryButtonTheme theme;

  const PrimaryButton({
    super.key,
    required this.title,
    this.height = 48.0,
    this.fitWidth = false,
    this.margin = const EdgeInsets.all(0),
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
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
        ),
        child: Text(title),
      ),
    );
  }
}
