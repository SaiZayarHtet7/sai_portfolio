import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sai_portfolio/src/custom/custom.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';
import 'package:sai_portfolio/src/modules/about/about.dart';
import 'package:sai_portfolio/src/my_app.dart';

import '../../contact/contact.dart';
import '../../experience/experience.dart';
import 'widgets/vertical_contact.dart';
import 'widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  var headerHeight = 55.00;

  late Animation headerAnimation;

  //headerController
  late AnimationController animationController;

  //menu icon controller
  late AnimationController iconAnimController;

  //Menu controller
  late AnimationController menuController;
  late Animation menuAnimation;

  @override
  void initState() {
    super.initState();
    //headerController

    double deviceHeight = materialKey.currentContext!.dh;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    headerAnimation =
        Tween(begin: 0, end: -headerHeight).animate(animationController);

    //menu icon controller
    iconAnimController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    //Menu controller
    menuController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    menuAnimation =
        Tween(begin: -(deviceHeight + headerHeight), end: headerHeight)
            .animate(menuController);
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (headerAnimation.value == 0) {
        animationController.forward();
      }
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (headerAnimation.value == -55) {
        animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: context.backGround(),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                const IntroPage(),
                AboutPage(key: menuList[0].globalKey!),
                ExperiencePage(key: menuList[1].globalKey!),
                ContactPage(key: menuList[3].globalKey!),
              ],
            ),
          ),
          //mobile menu
          AnimatedBuilder(
            animation: menuAnimation,
            builder: (context, child) {
              return Transform.translate(
                  offset: Offset(0, menuAnimation.value), child: child!);
            },
            child: Container(
              decoration: BoxDecoration(color: context.backGround()),
              width: context.dw,
              height: context.dh,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: menuList
                      .map((e) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () async {
                                  iconAnimController.reverse();
                                  menuController.reverse();
                                  final context = e.globalKey;
                                  if (context == null) {
                                    return;
                                  }
                                  await Scrollable.ensureVisible(
                                    context.currentContext!,
                                    curve: Curves.ease,
                                    // alignment: position.dy,
                                    duration: const Duration(milliseconds: 300),
                                  );
                                },
                                child: NavButton(
                                    text: e.menu ?? "", number: e.number ?? ""),
                              ),
                              if (!(e.isTheLast ?? false)) 20.height
                            ],
                          ))
                      .toList()),
            ),
          ),

          //header
          AnimatedBuilder(
            animation: headerAnimation,
            builder: (context, child) {
              return Transform.translate(
                  offset: Offset(0, headerAnimation.value), child: child!);
            },
            child: HeaderBar(
                controller: iconAnimController,
                onMenuTap: () {
                  if (menuAnimation.value == headerHeight) {
                    //close menu
                    iconAnimController.reverse();
                    menuController.reverse();
                  } else {
                    iconAnimController.forward();
                    menuController.forward();
                  }
                }),
          ),
          //for context in desktop
          const Align(
              alignment: Alignment.bottomRight, child: VerticalContact()),
        ],
      ),
    );
  }
}
