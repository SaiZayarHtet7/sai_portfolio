import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/custom/my_text.dart';
import 'package:sai_portfolio/src/custom/title_widget.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';
import 'package:sai_portfolio/src/modules/experience/experience.dart';
import 'package:sai_portfolio/src/util/util.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  List<ExperienceModel> experienceList = [
    ExperienceModel(
        company: "Myanmar Information Technology",
        position: "Internship Flutter Developer",
        description:
            "I am responsible for  developed and currently maintain applications for real government projects, such as the Labor Registration Application and Payment Application by using Flutter, REST API, and Firebase technologies.",
        startDate: "Jun/2020",
        image: ImageUtils.mit,
        endDate: "Oct/2020"),
    ExperienceModel(
        startDate: "Apr/2021",
        endDate: "Oct/2021",
        image: ImageUtils.ucst,
        company: "Freelance",
        position: "Programming Teacher",
        description:
            "I have experience teaching programming basics to children through Code.org and Scratch courses. Additionally, I have instructed them on how to develop simple websites using HTML and CSS for design purposes."),
    ExperienceModel(
        startDate: "Dec/2021",
        endDate: "Present",
        image: ImageUtils.slash,
        company: "Slash Myanmar",
        position: "Freelancer & Co-Founder",
        description:
            "My friends and I co-founded a company with the aim of providing enhanced IT solutions for businesses. We have developed a user-friendly and versatile POS system as our flagship product. \nIn addition to that, we offer mobile and web development services to cater to the diverse needs of our valuable customers. \nOur main focus is on understanding and fulfilling our users' requirements, and we make it a priority to regularly meet with them to deliver optimal solutions that are beneficial and profitable for their businesses."),
    ExperienceModel(
        startDate: "Jan/2022",
        endDate: "Present",
        image: ImageUtils.sfeg,
        company: "Strategy First Education Group",
        position: "Senior Flutter Developer",
        description:
            "I am responsible for the development and maintenance of a mobile application provided by Strategy First Education Group, aimed at offering a higher education system for Myanmar.Working closely with my skilled team, we collaboratively create improved solutions for education in Myanmar."),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.dw / 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          75.height,
          
          MyTitleWidget(title: StringUtils.experience, number: "02"),
          30.height,
          MyText(StringUtils.experienceText),
          40.height,
          ListView.separated(
            itemCount: experienceList.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ExperienceWidget(
                  experienceModel: experienceList[index], index: index);
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index == experienceList.length) {
                return 0.height;
              }
              return 20.height;
            },
          ),
          Align(
            alignment:
                context.isNotMobile ? Alignment.center : Alignment.topLeft,
            child: SizedBox(
              width: 50,
              height: 70,
              child: Stack(children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: VerticalDivider(
                    color: context.primary(),
                    thickness: 1.5,
                  ),
                ),
                Positioned(
                  top: 40,
                  width: 50,
                  child: Icon(
                    Icons.arrow_downward,
                    size: 15,
                    color: context.primary(),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
