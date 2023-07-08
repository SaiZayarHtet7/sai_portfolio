import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/extension/color_extension.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';
import 'package:sai_portfolio/src/extension/sb_extension.dart';
import 'package:sai_portfolio/src/extension/size_extension.dart';
import 'package:sai_portfolio/src/util/string_utils.dart';

import '../../../../custom/nav_btn.dart';
import '../logo_widget.dart';
import '../../data/data.dart';

typedef MenuList = List<MenuModel>;

MenuList menuList = [
  MenuModel(
    menu: StringUtils.about,
    number: "01",
    globalKey: GlobalKey(debugLabel: "about"),
  ),
  MenuModel(
    menu: StringUtils.experience,
    number: "02",
    globalKey: GlobalKey(debugLabel: "experience"),
  ),
  MenuModel(
    menu: StringUtils.work,
    number: "03",
    globalKey: GlobalKey(debugLabel: "work"),
  ),
  MenuModel(
    menu: StringUtils.contact,
    number: "04",
    isTheLast: true,
    globalKey: GlobalKey(debugLabel: "contact"),
  ),
];

class HeaderBar extends StatefulWidget {
  final Function() onMenuTap;
  final AnimationController controller;

  const HeaderBar({
    super.key,
    required this.controller,
    required this.onMenuTap,
  });

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.backGround()),
      padding: const EdgeInsets.symmetric(vertical: 10)
          .copyWith(left: context.dw / 25, right: context.dw / 25),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LogoWidget(),
          Flexible(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: context.isMobile
                  ? GestureDetector(
                      onTap: () {
                        widget.onMenuTap();
                      },
                      child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          size: 25,
                          progress: widget.controller),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: menuList
                          .map((e) => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final context = e.globalKey;
                                      if (context == null) {
                                        return;
                                      }
                                      await Scrollable.ensureVisible(
                                        context.currentContext!,
                                        curve: Curves.ease,
                                        // alignment: position.dy,
                                        duration:
                                            const Duration(milliseconds: 300),
                                      );
                                    },
                                    child: NavButton(
                                        text: e.menu ?? "",
                                        number: e.number ?? ""),
                                  ),
                                  if (!(e.isTheLast ?? false)) 40.width,
                                ],
                              ))
                          .toList()
                      //  [
                      //   NavButton(
                      //     text: "About",
                      //     number: "01",
                      //   ),
                      //   SizedBox(width: 40),
                      //   NavButton(
                      //     text: "Experience",
                      //     number: "02",
                      //   ),
                      //   SizedBox(width: 40),
                      //   NavButton(
                      //     text: "Work",
                      //     number: "03",
                      //   ),
                      //   SizedBox(width: 40),
                      //   NavButton(
                      //     text: "Contact",
                      //     number: "04",
                      //   ),
                      // ],
                      ),
            ),
          )
        ],
      ),
    );
  }
}
