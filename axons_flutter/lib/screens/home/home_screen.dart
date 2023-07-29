import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/extensions/image_extensions.dart';
import 'package:axons_flutter/screens/home/widgets/carousel_banner.dart';
import 'package:axons_flutter/screens/home/widgets/my_app_menu_list.dart';
import 'package:axons_flutter/screens/home/widgets/home_main_menu.dart';
import 'package:axons_flutter/screens/home/widgets/horizontal_image_slider_banner.dart';
import 'package:axons_flutter/screens/home/widgets/menu_section.dart';
import 'package:axons_flutter/screens/home/widgets/news_item.dart';
import 'package:axons_flutter/widgets/containment/spacer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final List<String> _mockBanners = ["banner1.png", "banner1.png", "banner1.png"].map((e) => e.assetPath).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: _buildAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CarouselBanner(urls: _mockBanners),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: -68,
                    child: const HomeMainMenu(),
                  ),
                ],
              ),
              const VSpacer(76.0),
              _buildMyAppView(),
              _buildPriviledgeView(),
              const VSpacer(8.0),
              _buildNewsView(),
              const VSpacer(8.0),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      height: 65,
      backgroundColor: context.theme.primaryColor,
      showSearchBar: true,
      showHambergerMenu: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.chat_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
    );
  }

  Widget _buildMyAppView() {
    return MenuSection(
      title: tr("home_page.my_app_title"),
      content: const MyAppMenuList(),
      transaparentBackground: true,
    );
  }

  Widget _buildPriviledgeView() {
    final List<String> mockPriviledges = ["priviledge_banner3.png", "priviledge_banner2.png", "news_banner1.png", "news_banner2.png"];

    return MenuSection(
      title: tr("home_page.my_privilege_title"),
      hasSeeAll: true,
      content: HorizontalImageSliderBanner(
        assetsPaths: mockPriviledges.map((e) => e.assetPath).toList(),
      ),
    );
  }

  Widget _buildNewsView() {
    return MenuSection(
      title: tr("home_page.my_privilege_title"),
      hasSeeAll: true,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            NewsItem(
              assetPath: "news_banner1.png".assetPath,
              title: "AXONS คว้า 3 รางวัลชนะเลิศ",
              subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              view: "2.5k",
              date: "3 Nov 2022",
            ),
            NewsItem(
              assetPath: "news_banner2.png".assetPath,
              title: "Hack for GOOD Well-Being Creation นวัตกรรมดีเมืองดี..",
              subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              view: "2.5k",
              date: "3 Nov 2022",
            ),
          ],
        ),
      ),
    );
  }
}
