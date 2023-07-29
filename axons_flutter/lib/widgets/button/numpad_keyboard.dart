import 'package:axons_flutter/widgets/button/numpad_button.dart';
import 'package:flutter/material.dart';

class NumpadKeyboard extends StatelessWidget {
  final Function(int) onSelected;

  const NumpadKeyboard({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: 1)),
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: 2)),
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: 3)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: 4)),
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: 5)),
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: 6)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: 7)),
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: 8)),
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: 9)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(child: Spacer()),
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: 0)),
            Expanded(child: NumpadButton(onTap: _onSelectedButton, number: -1)),
          ],
        )
      ],
    );
  }

  void _onSelectedButton(value) async {
    await Future.delayed(const Duration(milliseconds: 200));
    onSelected(value);
  }
}
