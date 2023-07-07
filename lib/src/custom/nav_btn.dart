import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';

import 'my_text.dart';

class NavButton extends StatefulWidget {
  final String text, number;

  const NavButton({super.key, required this.text, required this.number});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) {
          _controller.forward();
        },
        onExit: (event) {
          _controller.reverse();
        },
        child: NavStaggerAnimation(
          controller: _controller,
          text: widget.text,
          number: widget.number,
        ));
  }
}

class NavStaggerAnimation extends StatelessWidget {
  NavStaggerAnimation(
      {Key? key,
      required this.controller,
      required this.text,
      required this.number})
      : opacity = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        innerOpacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        lineWidth = Tween<double>(
          begin: 0.0,
          end: 30.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> innerOpacity;
  final Animation<double> opacity;
  final Animation<double> lineWidth;
  final String text, number;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 13),
        Stack(
          children: [
            Opacity(
              opacity: innerOpacity.value,
              child: NavOutlineText(
                "$number  $text",
                style: context.getBodyMedium().copyWith(wordSpacing: -10),
              ),
            ),
            Opacity(
              opacity: opacity.value,
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: "$number  ",
                    style: context
                        .getBodyMedium()
                        .copyWith(wordSpacing: -10, color: context.primary())),
                TextSpan(text: text)
              ], style: context.getBodyMedium().copyWith(wordSpacing: -10))),
            )
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 3,
          width: lineWidth.value,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: context.getBodyMedium().color),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class NavOutlineText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const NavOutlineText(
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        MyText(
          text,
          style: (style ?? context.getBodyMedium()).copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..color = context.primary()
                ..strokeWidth = 2),
        ),
        // Solid text as fill.
        MyText(
          text,
          style: (style ?? context.getBodyMedium())
              .copyWith(color: context.backGround()),
        )
      ],
    );
  }
}
