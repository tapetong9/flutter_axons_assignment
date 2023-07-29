import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:axons_flutter/widgets/textFormField/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final double height;
  final bool centerTitle;
  final List<Widget>? actions;
  final bool showSearchBar;
  final bool showHambergerMenu;

  const CustomAppBar({
    super.key,
    this.backgroundColor = Colors.white,
    this.title = "",
    this.height = 48.0,
    this.centerTitle = false,
    this.actions,
    this.showSearchBar = false,
    this.showHambergerMenu = false,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    final isLightBackground = backgroundColor == Colors.white || backgroundColor == Colors.transparent;

    return Container(
      color: backgroundColor,
      child: AppBar(
        title: showSearchBar ? const SearchField() : _buildTextTitle(context, isLightBackground: isLightBackground),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: context.theme.primaryColor,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: isLightBackground ? Brightness.light : Brightness.dark, // For iOS (dark icons)
        ),
        elevation: 0,
        centerTitle: centerTitle,
        iconTheme: IconThemeData(color: isLightBackground ? Colors.blueGrey : Colors.white),
        backgroundColor: Colors.transparent,
        actions: actions,
        leading: showHambergerMenu ? IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined)) : null,
      ),
    );
  }

  Widget _buildTextTitle(BuildContext context, {required bool isLightBackground}) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(color: isLightBackground ? null : Colors.white),
    );
  }
}
