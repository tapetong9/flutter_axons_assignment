import 'package:flutter/material.dart';

class HorizontalImageSliderBanner extends StatelessWidget {
  final List<String> assetsPaths;

  const HorizontalImageSliderBanner({super.key, required this.assetsPaths});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16.0),
        itemCount: assetsPaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image.asset(assetsPaths[index], width: 160, height: 160, fit: BoxFit.fill),
          );
        },
      ),
    );
  }
}
