import 'package:flutter/material.dart';

enum PushType { push, replace, clearStack }

enum PopType { pop, clearStack }

class NavigateUtil {
  void push(
    BuildContext context, {
    required Widget to,
    PushType type = PushType.push,
  }) {
    switch (type) {
      case PushType.push:
        Navigator.push(context, MaterialPageRoute(builder: (context) => to));
        break;
      case PushType.replace:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => to));
        break;
      case PushType.clearStack:
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => to), (route) => false);
        break;
      default:
    }
  }

  void pop(
    BuildContext context, {
    PopType type = PopType.pop,
  }) {
    switch (type) {
      case PopType.pop:
        Navigator.pop(context);
        break;
      case PopType.clearStack:
        Navigator.popUntil(context, (route) => false);
        break;
      default:
    }
  }
}
