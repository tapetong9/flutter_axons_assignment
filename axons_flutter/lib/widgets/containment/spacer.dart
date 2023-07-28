import 'package:flutter/material.dart';

class VSpacer extends StatelessWidget {
  final double space;
  const VSpacer(this.space, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}

class HSpacer extends StatelessWidget {
  final double space;
  const HSpacer(this.space, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space);
  }
}
