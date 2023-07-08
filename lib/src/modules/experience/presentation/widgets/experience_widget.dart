import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';

import '../../../../custom/custom.dart';
import '../../data/data.dart';
import '../presentation.dart';

class ExperienceWidget extends StatelessWidget {
  final ExperienceModel experienceModel;
  final int index;
  const ExperienceWidget({
    super.key,
    required this.experienceModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isIndexEven = index % 2 == 0;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: context.isMobile || !isIndexEven
            ? TextDirection.rtl
            : TextDirection.ltr,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: ExperienceContainer(
              isArrowLeft: context.isMobile || !isIndexEven ? true : false,
              experienceModel: experienceModel,
            ),
          ),
          10.width,
          Column(
            children: [
              MyImage(
                image: experienceModel.image ?? "",
                width: 50,
                height: 50,
              ),
              20.height,
              Expanded(
                  child: VerticalDivider(
                color: context.primary(),
                thickness: 1.5,
              )),
            ],
          ),
          if (context.isNotMobile) 10.width,
          if (context.isNotMobile)
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Align(
                alignment: isIndexEven ? Alignment.topLeft : Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: MyText(
                      "${experienceModel.startDate ?? ""}-${experienceModel.endDate ?? "-"}"),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
