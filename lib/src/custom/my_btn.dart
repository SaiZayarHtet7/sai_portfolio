import 'package:flutter/material.dart';
import 'custom.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';

class MyButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse().then((value) {
            widget.onPressed();
            _controller.forward();
          });
        } else {
          _controller.forward().then((value) {
            widget.onPressed();
            _controller.reverse();
          });
        }
      },
      child: MouseRegion(
          onEnter: (event) {
            _controller.forward();
          },
          onExit: (event) {
            _controller.reverse();
          },
          child: MyStaggerAnimation(
            controller: _controller,
            text: widget.text,
          )),
    );
  }
}

class MyStaggerAnimation extends StatelessWidget {
  MyStaggerAnimation({
    Key? key,
    required this.controller,
    required this.text,
  })  : opacity = Tween<double>(
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
        topAlignment = Tween<Alignment>(
          begin: Alignment.center,
          end: Alignment.topLeft,
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
        bottomAlignment = Tween<Alignment>(
          begin: Alignment.center,
          end: Alignment.bottomRight,
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
  final Animation<Alignment> topAlignment;
  final Animation<Alignment> bottomAlignment;
  final String text;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    BoxDecoration buttonDecoration = BoxDecoration(
        border: Border.all(style: BorderStyle.solid, color: context.primary()),
        borderRadius: BorderRadius.circular(5));
    const double buttonWidth = 200;
    const double buttonHeight = 50;
    return SizedBox(
      width: buttonWidth + 8,
      height: buttonHeight + 8,
      child: Stack(
        children: [
          Align(
            child: Container(
              alignment: topAlignment.value,
              child: Container(
                decoration: buttonDecoration,
                width: buttonWidth,
                height: buttonHeight,
              ),
            ),
          ),
          Align(
            child: Container(
              alignment: bottomAlignment.value,
              child: Container(
                decoration: buttonDecoration,
                width: buttonWidth,
                height: buttonHeight,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: buttonDecoration,
              width: buttonWidth,
              height: buttonHeight,
              child: Center(
                child: MyText(text,
                    style: context
                        .getBodyMedium()
                        .copyWith(wordSpacing: 0, color: context.primary())),
                // child: Stack(
                //   children: [
                //     Opacity(
                //       opacity: innerOpacity.value,
                //       child: OutlineText(
                //         text,
                //         style: context
                //             .getBodyMedium()
                //             .copyWith(wordSpacing: 0, color: context.primary()),
                //       ),
                //     ),
                //     Opacity(
                //       opacity: opacity.value,
                //       child: MyText(text,
                //           style: context.getBodyMedium().copyWith(
                //               wordSpacing: 0, color: context.primary())),
                //     )
                //   ],
                // ),
              ),
            ),
          ),
        ],
      ),
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

class OutlineText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const OutlineText(
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
