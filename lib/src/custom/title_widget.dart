import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/custom/custom.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';

class MyTitleWidget extends StatelessWidget {
  final String title;
  final String number;
  const MyTitleWidget({super.key, required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "$number ",
                  style: context
                      .getTitleMedium()
                      .copyWith(color: context.primary())),
              TextSpan(
                text: title,
              ),
            ],
          ),
          style: context.getTitleMedium(),
        ),
        10.width,
        if (context.isNotMobile)
          SizedBox(
              width: context.isTablet ? 100 : 250,
              child: Divider(
                color: context.textColor(),
                thickness: 1.5,
              )),
      ],
    );
  }
}

class MySubTitleWidget extends StatelessWidget {
  final String title;
  const MySubTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MyText(
      title,
      style: context.getTitleSmall().copyWith(
            color: context.textColor(),
          ),
    );
  }
}
