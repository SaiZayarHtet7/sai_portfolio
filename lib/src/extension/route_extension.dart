import 'package:flutter/material.dart';
import 'extensions.dart';

extension RouteExtension on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
    widget.toStringShort().log();
  }

  void back() {
    "back".log();
    Navigator.pop(this);
  }

  void pushReplacement(Widget widget) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(
      builder: (context) => widget,
    ));
    widget.toStringShort().log();
  }
}
