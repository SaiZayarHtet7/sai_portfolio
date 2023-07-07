import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/extension/size_extension.dart';

import '../../../../custom/nav_btn.dart';
import '../logo_widget.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({
    super.key,
  });

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        animationController.forward();
                      },
                      child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          size: 25,
                          progress: animationController),
                    )
                  : const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NavButton(
                          text: "About",
                          number: "01",
                        ),
                        SizedBox(width: 40),
                        NavButton(
                          text: "Experience",
                          number: "02",
                        ),
                        SizedBox(width: 40),
                        NavButton(
                          text: "Work",
                          number: "03",
                        ),
                        SizedBox(width: 40),
                        NavButton(
                          text: "Contact",
                          number: "04",
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
