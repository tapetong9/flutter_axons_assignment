import 'package:flutter/material.dart';

class NavigateUtil {
  void navigate(BuildContext context, {required Widget to, bool replace = false}) {
    if (replace) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => to));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => to));
    }
  }
}
