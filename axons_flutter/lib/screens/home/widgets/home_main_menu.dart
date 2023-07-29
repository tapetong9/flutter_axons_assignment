import 'package:axons_flutter/extensions/image_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'main_menu_item.dart';

class HomeMainMenu extends StatelessWidget {
  final Function()? onTapFarmAnalytic;
  final Function()? onTapCustomerPriviledge;

  const HomeMainMenu({super.key, this.onTapFarmAnalytic, this.onTapCustomerPriviledge});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: MainMenuItem(
              assetPath: "farm_analytic_menu.png".assetPath,
              title: tr("home_page.main_menu.farm_analytic"),
              onTap: onTapFarmAnalytic,
            ),
          ),
          Container(
            width: 1,
            height: 44,
            color: Colors.grey.shade300,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
          Expanded(
            child: MainMenuItem(
              assetPath: "customer_priviledge_menu.png".assetPath,
              title: tr("home_page.main_menu.customer_privilege"),
              onTap: onTapCustomerPriviledge,
            ),
          ),
        ],
      ),
    );
  }
}
