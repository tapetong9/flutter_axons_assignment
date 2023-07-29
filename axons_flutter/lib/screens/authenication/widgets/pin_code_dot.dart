import 'package:axons_flutter/extensions/image_extensions.dart';
import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:flutter/material.dart';

class PinCodeDot extends StatefulWidget {
  final int value;

  const PinCodeDot({super.key, required this.value});

  @override
  State<PinCodeDot> createState() => _PinCodeDotState();
}

class _PinCodeDotState extends State<PinCodeDot> {
  @override
  Widget build(BuildContext context) {
    final selected = Image.asset("pin_dot.png".assetPath, width: 24, height: 24);
    final unselected = Image.asset("unselected_pin_dot.png".assetPath, width: 24, height: 24);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.value > 0 ? selected : unselected,
        const HSpacer(16),
        widget.value > 1 ? selected : unselected,
        const HSpacer(16),
        widget.value > 2 ? selected : unselected,
        const HSpacer(16),
        widget.value > 3 ? selected : unselected,
      ],
    );
  }
}
