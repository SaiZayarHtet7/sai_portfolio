import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/custom/my_image.dart';
import 'package:sai_portfolio/src/custom/my_text.dart';
import 'package:sai_portfolio/src/custom/title_widget.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';
import 'package:sai_portfolio/src/util/util.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double aboutWidgetPosition = 0;
  double parentWidgetPosition = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dw,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: context.dw / 15),
        // color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            20.height,
            MyTitleWidget(title: StringUtils.about, number: "01"),
            30.height,
            Flex(
              direction: context.isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.end,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              verticalDirection: VerticalDirection.up,
              textDirection: TextDirection.ltr,
              children: [
                context.isMobile
                    ? MyText(StringUtils.myAbout)
                    : Flexible(child: MyText(StringUtils.myAbout)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    ImageUtils.profile,
                    fit: BoxFit.cover,
                    width: context.isMobile ? context.dw : 250,
                    height: context.isMobile ? context.dw : 250,
                  ),
                ),
              ],
            ),
            20.height,
            MySubTitleWidget(title: StringUtils.technologyIUse).center,
            40.height,
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: context.dw / 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Constants.mySkillList.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: context.isLaptop || context.isTablet ? 3 : 2,
                crossAxisCount: context.isLaptop
                    ? 4
                    : context.isTablet
                        ? 3
                        : 2,
                crossAxisSpacing: context.isNotLaptop
                    ? 10
                    : context.isTablet
                        ? 30
                        : 50,
                mainAxisSpacing: context.isNotLaptop ? 30 : 50,
              ),
              itemBuilder: (context, index) {
                final String image = Constants.mySkillList[index];
                return MyImage(
                  image: image,
                );
              },
            ),
            50.height,
          ],
        ),
      ),
    );
  }
}
