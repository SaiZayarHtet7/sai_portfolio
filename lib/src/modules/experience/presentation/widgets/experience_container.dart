import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';

import '../../../../custom/custom.dart';
import '../../experience.dart';

class ExperienceContainer extends StatelessWidget {
  final ExperienceModel experienceModel;
  final bool isArrowLeft;

  const ExperienceContainer(
      {super.key, required this.isArrowLeft, required this.experienceModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: isArrowLeft ? Alignment.topLeft : Alignment.topRight,
          child: Transform.rotate(
            angle: isArrowLeft ? -pi + 15 : -pi - 15,
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              width: 20,
              height: 20,
              decoration: BoxDecoration(color: context.surface()),
            ),
          ),
        ),
        Align(
          alignment: isArrowLeft ? Alignment.topRight : Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(
                right: isArrowLeft ? 0 : 13, left: isArrowLeft ? 13 : 0),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: context.surface(),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(experienceModel.position ?? ""),
                5.height,
                MyText(
                  experienceModel.company ?? "",
                  style: context
                      .getBodyMedium()
                      .copyWith(color: context.primary()),
                ),
                5.height,
                MyText(experienceModel.description ?? ""),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
