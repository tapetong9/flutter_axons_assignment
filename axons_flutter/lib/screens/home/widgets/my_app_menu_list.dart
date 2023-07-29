import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/extensions/image_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../models/menu_model.dart';
import 'my_app_menu_item.dart';

class MyAppMenuList extends StatefulWidget {
  const MyAppMenuList({super.key});

  @override
  State<MyAppMenuList> createState() => _MyAppMenuListState();
}

class _MyAppMenuListState extends State<MyAppMenuList> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  final _menus = [
    MenuModel(
      assetPath: "smart_farm_menu.png".assetPath,
      title: tr("home_page.my_app_menu.smart_farm"),
    ),
    MenuModel(
      assetPath: "market_plan_menu.png".assetPath,
      title: tr("home_page.my_app_menu.market_plan"),
    ),
    MenuModel(
      assetPath: "customer_feedback_menu.png".assetPath,
      title: tr("home_page.my_app_menu.customer_feedback"),
    ),
    MenuModel(
      assetPath: "smart_farm_menu.png".assetPath,
      title: tr("home_page.my_app_menu.smart_farm"),
    ),
    MenuModel(
      assetPath: "market_plan_menu.png".assetPath,
      title: tr("home_page.my_app_menu.market_plan"),
    ),
    MenuModel(
      assetPath: "customer_feedback_menu.png".assetPath,
      title: tr("home_page.my_app_menu.customer_feedback"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 98.0,
            viewportFraction: 1 / 3,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: _menus.map((menu) {
            return Builder(
              builder: (BuildContext context) {
                return MyAppMenuItem(
                  assetPath: menu.assetPath,
                  title: menu.title,
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (var i = 1; i <= (_menus.length / 3).ceil(); i += 1) i].map(
            (page) {
              final currentPage = ((_current + 1) / 3).ceil();

              return GestureDetector(
                onTap: () => _controller.animateToPage(page - 1),
                child: Container(
                  width: 6.0,
                  height: 6.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.primaryColor.withOpacity(
                      currentPage == page ? 0.9 : 0.4,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
