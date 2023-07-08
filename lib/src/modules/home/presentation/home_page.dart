import 'package:flutter/material.dart';
import 'package:sai_portfolio/src/extension/extensions.dart';
import 'package:sai_portfolio/src/modules/about/about.dart';

import '../../contact/contact.dart';
import '../../experience/experience.dart';
import 'widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: context.backGround(),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            child: const Column(
              children: [
                IntroPage(),
                AboutPage(),
                ExperiencePage(),
                ContactPage(),
              ],
            ),
          ),
          const HeaderBar(),
        ],
      ),
    );
  }
}
