import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MenuSection extends StatelessWidget {
  final String title;
  final bool hasSeeAll;
  final Widget content;
  final bool transaparentBackground;
  final Function()? onTapSeeAll;

  const MenuSection({
    super.key,
    required this.content,
    required this.title,
    this.hasSeeAll = false,
    this.transaparentBackground = false,
    this.onTapSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: transaparentBackground ? null : Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(title, style: context.textTheme.titleSmall),
                const Spacer(),
                if (hasSeeAll)
                  InkWell(
                    onTap: onTapSeeAll,
                    child: Text(
                      tr("home_page.see_all"),
                      style: context.textTheme.bodyMedium?.copyWith(fontSize: 14, color: const Color.fromRGBO(0, 134, 201, 1.0)),
                    ),
                  ),
              ],
            ),
          ),
          const VSpacer(16.0),
          content,
        ],
      ),
    );
  }
}
