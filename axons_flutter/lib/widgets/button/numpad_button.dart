import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/extensions/image_extensions.dart';
import 'package:flutter/material.dart';

class NumpadButton extends StatefulWidget {
  final int number;
  final Function(int) onTap;

  const NumpadButton({super.key, required this.onTap, required this.number});

  @override
  State<NumpadButton> createState() => _NumpadButtonState();
}

class _NumpadButtonState extends State<NumpadButton> {
  bool _isHighlight = false;

  @override
  Widget build(BuildContext context) {
    String assetName = "";

    if (widget.number == -1) {
      assetName = _isHighlight ? "del-b.png" : "del.png";
    } else {
      assetName = _isHighlight ? "${widget.number}b.png" : "${widget.number}.png";
    }

    return Container(
      padding: const EdgeInsets.all(3),
      height: 58.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              color: _isHighlight ? context.theme.primaryColor : Colors.grey.shade300,
            ),
          ),
        ),
        onPressed: _onTap,
        child: Image.asset(assetName.assetPath, height: 18),
      ),
    );
  }

  void _onTap() {
    widget.onTap(widget.number);

    setState(() {
      _isHighlight = true;
    });

    Future.delayed(const Duration(milliseconds: 150)).then(
      (_) {
        setState(() {
          _isHighlight = false;
        });
      },
    );
  }
}
