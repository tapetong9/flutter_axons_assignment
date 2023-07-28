import 'dart:developer';

import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final String initialValue;
  final String? placeholderText;
  final bool obscureText;
  final bool autofocus;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;

  const TextInputField({
    super.key,
    this.initialValue = "",
    this.obscureText = false,
    this.placeholderText,
    this.autofocus = false,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool _isObscure = false;
  final textColor = const Color.fromRGBO(52, 64, 84, 1.0);

  @override
  void initState() {
    super.initState();

    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      obscureText: _isObscure,
      initialValue: widget.initialValue,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor),
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.placeholderText,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: _onPressObscure,
                icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility, size: 24.0),
              )
            : null,
      ),
    );
  }

  void _onPressObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }
}
