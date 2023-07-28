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
    final selected = Image.asset("assets/images/pin_dot.png", width: 24, height: 24);
    final unselected = Image.asset("assets/images/unselected_pin_dot.png", width: 24, height: 24);

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
