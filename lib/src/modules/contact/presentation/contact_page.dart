import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';

import '../../../custom/custom.dart';
import '../../../util/util.dart';
import '../../mouse_tilt/mouse_tilt.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.dw / 10),
      width: context.dw,
      height: context.dh,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: MyTitleWidget(
                number: "04",
                title: StringUtils.contact,
              ),
            ),
          ),
          ParallaxStack(
            layers: [
              ParallaxLayer(
                yRotation: 0.1,
                xRotation: 0.1,
                xOffset: -20,
                yOffset: -20,
                zRotation: 0.1,
                child: Center(
                  child: Container(
                      width: 700,
                      height: 300,
                      decoration: BoxDecoration(
                          color: context.surface(),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              ParallaxLayer(
                yRotation: 0.1,
                xRotation: 0.1,
                xOffset: 20,
                yOffset: 20,
                zRotation: 0.1,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FittedBox(
                          child: MyText(
                            StringUtils.contactTitle,
                            textAlign: TextAlign.center,
                            style:
                                context.getBodyLarge().copyWith(fontSize: 30),
                          ),
                        ),
                        20.height,
                        MyButton(
                            text: StringUtils.sayHello,
                            onPressed: () async {
                              await StringUtils.sendMyMail.goToUrl();
                            }),
                        20.height,
                        FittedBox(
                          child: MyText(
                            StringUtils.myMail,
                            style: context.getTitleMedium().copyWith(
                                fontFamily: Constants.cerebriFont,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  MyText(
                    StringUtils.buildWith,
                  ),
                  MyText(
                    StringUtils.flutter,
                    style: context
                        .getBodyMedium()
                        .copyWith(color: context.primary()),
                  ),
                  MyText(
                    StringUtils.deployOn,
                  ),
                  MyText(
                    StringUtils.firebase,
                    style: context
                        .getBodyMedium()
                        .copyWith(color: context.primary()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
