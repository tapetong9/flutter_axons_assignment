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
    String assetPath = "assets/images/";

    if (widget.number == -1) {
      assetPath += _isHighlight ? "del-b.png" : "del.png";
    } else {
      assetPath += _isHighlight ? "${widget.number}b.png" : "${widget.number}.png";
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
              color: _isHighlight ? Theme.of(context).primaryColor : Colors.grey.shade300,
            ),
          ),
        ),
        onPressed: _onTap,
        child: Image.asset(assetPath, height: 18),
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
