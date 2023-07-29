import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final String assetPath;
  final String title;
  final String subtitle;
  final String view;
  final String date;
  final Function()? onTap;

  const NewsItem({super.key, this.onTap, required this.assetPath, required this.title, required this.subtitle, required this.view, required this.date});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(assetPath, width: 130.0, height: 130.0),
          const HSpacer(16.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(subtitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400), maxLines: 2),
                const VSpacer(4),
                Row(
                  children: [
                    const Icon(Icons.visibility_outlined, size: 16.0),
                    const HSpacer(4),
                    Text(view, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                    Text(
                      tr("home_page.read_more"),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color.fromRGBO(0, 134, 201, 1.0)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
