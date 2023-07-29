import 'package:axons_flutter/widgets/textFormField/text_input_field.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String)? onChanged;
  final Function()? onEditingComplete;

  const SearchField({super.key, this.onChanged, this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextInputField(
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        placeholderText: 'Search',
        prefixIcon: const Icon(Icons.search, size: 18.0),
      ),
    );
  }
}
