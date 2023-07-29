import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:flutter/material.dart';

class MainMenuItem extends StatelessWidget {
  final String assetPath;
  final String title;
  final Function()? onTap;

  const MainMenuItem({super.key, this.onTap, required this.assetPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(assetPath, width: 44.0, height: 44.0),
          const HSpacer(8.0),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
