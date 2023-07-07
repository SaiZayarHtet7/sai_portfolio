import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';


class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        const TextSpan(text: "Zayar"),
        TextSpan(
            text: ".",
            style: context.getTitleLarge().copyWith(color: context.primary())),
        const TextSpan(text: "Tech")
      ]),
      style: context.getTitleLarge(),
    );
  }
}
