import 'package:flutter/widgets.dart';

class MenuModel {
  final String? number;
  final String? menu;
  final GlobalKey? globalKey;
  bool? isTheLast = false;

  MenuModel({this.number, this.menu, this.isTheLast, this.globalKey});

  MenuModel copyWith(
          {String? number,
          String? menu,
          bool? isTheLast,
          GlobalKey? globalKey}) =>
      MenuModel(
          globalKey: globalKey ?? this.globalKey,
          number: number ?? this.number,
          menu: menu ?? this.menu,
          isTheLast: this.isTheLast);
}
