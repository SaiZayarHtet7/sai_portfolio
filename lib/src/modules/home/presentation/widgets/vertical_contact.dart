import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';

import '../../../../custom/custom.dart';
import '../../../../util/util.dart';

class VerticalContact extends StatelessWidget {
  const VerticalContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return const SizedBox();
    }
    return Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () async {
                await StringUtils.sendMyMail.goToUrl();
              },
              child: RotatedBox(
                quarterTurns: 1,
                child: MyText(StringUtils.myMail),
              ),
            ),
            20.height,
            InkWell(
              onTap: () async {
                await StringUtils.githubLink.goToUrl();
              },
              child: MyImage(
                image: ImageUtils.github,
                width: 30,
                height: 30,
              ),
            ),
            20.height,
            InkWell(
              onTap: () async {
                await StringUtils.linkedInLink.goToUrl();
              },
              child: MyImage(
                image: ImageUtils.linkedin,
                width: 30,
                height: 30,
              ),
            ),
            20.height,
            InkWell(
              onTap: () async {
                await StringUtils.facebookLink.goToUrl();
              },
              child: MyImage(
                image: ImageUtils.facebook,
                width: 30,
                height: 30,
              ),
            ),
            10.height,
            SizedBox(
                height: 150,
                child: VerticalDivider(
                  color: context.textColor(),
                  thickness: 2,
                )),
          ],
        ));
  }
}
