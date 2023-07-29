import 'package:axons_flutter/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final double height;
  final bool centerTitle;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    this.backgroundColor = Colors.white,
    this.title = "",
    this.height = 48.0,
    this.centerTitle = false,
    this.actions,
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
        title: Text(
          title,
          style: context.textTheme.titleMedium?.copyWith(color: isLightBackground ? null : Colors.white),
        ),
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
      ),
    );
  }
}
