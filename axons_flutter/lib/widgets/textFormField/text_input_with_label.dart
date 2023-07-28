import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:axons_flutter/widgets/textFormField/text_input_field.dart';
import 'package:flutter/material.dart';

class TextInputWithLabel extends StatelessWidget {
  final String label;
  final String initialValue;
  final String? placeholderText;
  final bool obscureText;
  final bool autofocus;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String) onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;

  const TextInputWithLabel({
    super.key,
    required this.label,
    this.initialValue = "",
    this.placeholderText,
    this.obscureText = false,
    this.autofocus = false,
    this.focusNode,
    this.validator,
    required this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const VSpacer(4.0),
        TextInputField(
          initialValue: initialValue,
          placeholderText: placeholderText,
          obscureText: obscureText,
          autofocus: autofocus,
          focusNode: focusNode,
          validator: validator,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
