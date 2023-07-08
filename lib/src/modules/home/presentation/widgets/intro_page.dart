import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/custom/my_btn.dart';
import 'package:sai_portfolio/src/custom/my_text.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';

import '../../../../util/util.dart';

GlobalKey introKey = GlobalKey();

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.dw;
    final height = context.dh;

    return Container(
      key: introKey,
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: width / 10),
      child: Stack(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (context.isMobile) 15.height,
                MyText(
                  StringUtils.myNameIs,
                  style: context.getBodyLarge().copyWith(
                      color: context.primary(), fontWeight: FontWeight.w800),
                ),
                15.height,
                MyText(
                  StringUtils.saiZayarHtet,
                  style: context.getTitleLarge().copyWith(
                      fontFamily: Constants.cerebriFont,
                      fontSize: 50,
                      color: context.textColor().withOpacity(1),
                      fontWeight: FontWeight.w900),
                ),
                10.height,
                MyText(
                  StringUtils.aFlutterDeveloper,
                  style: context.getTitleMedium().copyWith(
                      fontFamily: Constants.cerebriFont,
                      fontSize: 50,
                      color: context.textColor(),
                      fontWeight: FontWeight.w800),
                ),
                5.height,
                Padding(
                  padding: width > Constants.tablet
                      ? EdgeInsets.only(right: context.dw / 10)
                      : EdgeInsets.zero,
                  child: MyText(StringUtils.introText),
                ),
                10.height,
                MyButton(
                    text: StringUtils.getMyResume,
                    onPressed: () async {
                      await StringUtils.resumeLink.goToUrl();
                    })
              ]),
          if (width > Constants.mobile)
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                MyText(
                  StringUtils.knowMore,
                ),
                10.height,
                Container(
                  width: 20,
                  height: 30,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: context.textColor(), width: 2)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 10,
                      child: VerticalDivider(
                          width: 10, color: context.textColor(), thickness: 2),
                    ),
                  ),
                ),
                10.height,
              ]),
            )
        ],
      ),
    );
  }
}
