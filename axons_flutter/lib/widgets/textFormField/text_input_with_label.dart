import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:axons_flutter/widgets/textFormField/text_input_field.dart';
import 'package:flutter/material.dart';

class TextInputWithLabel extends StatelessWidget {
  final String label;
  final String initialValue;
  final String? placeholderText;
  final bool obscureText;
  final bool autofocus;
  final bool required;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;

  const TextInputWithLabel({
    super.key,
    required this.label,
    this.initialValue = "",
    this.placeholderText,
    this.obscureText = false,
    this.autofocus = false,
    this.required = false,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: context.textTheme.bodyMedium),
            if (required) const HSpacer(4),
            if (required) Text("*", style: context.textTheme.bodyMedium?.copyWith(color: Colors.red.shade900)),
          ],
        ),
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
