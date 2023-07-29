import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:flutter/material.dart';

class MyAppMenuItem extends StatelessWidget {
  final String assetPath;
  final String title;
  final Function()? onTap;

  const MyAppMenuItem({super.key, this.onTap, required this.assetPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(assetPath, width: 52.0, height: 52.0),
          const VSpacer(8.0),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
