import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final double height;
  final List<Widget>? actions;
  const CustomAppBar({super.key, this.backgroundColor = Colors.white, this.height = 48.0, this.actions});

  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        backgroundColor: Colors.transparent,
        actions: actions,
      ),
    );
  }
}
