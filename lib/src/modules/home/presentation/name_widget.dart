import 'package:flutter/material.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;
  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  final GlobalKey nameContainer = GlobalKey();
  final GlobalKey nameText = GlobalKey();

  //
  double nameTextWidth = 0;
  double nameTextHeight = 0;
  //
  Size nameContainerSize = const Size(0, 0);
  Offset nameContainerOffset = const Offset(0, 0);
  double nameContainerPosition = 0;

  void _getWidgetInfo() {
    final RenderBox nameContainerRenderBox =
        nameContainer.currentContext?.findRenderObject() as RenderBox;

    nameContainerOffset = nameContainerRenderBox.localToGlobal(Offset.zero);

    // final RenderBox nameTextRenderBox =
    //     nameText.currentContext?.findRenderObject() as RenderBox;

    nameContainerSize = nameContainerRenderBox.size;

    setState(() {
      nameContainerPosition = nameContainerOffset.dy;
    });
  }

  @override
  void initState() {
    widget.scrollController.addListener(() {
      final scrollOffset = widget.scrollController.offset;
      setState(() {
        nameContainerPosition = scrollOffset + nameContainerOffset.dy;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      color: Colors.tealAccent,
      height: height * 3,
      child: Stack(
        children: [
          Positioned(
            top: nameContainerPosition,
            width: width,
            height: height,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      key: nameContainer,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Sai Zayar  Htet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 100,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class NameWidget extends StatefulWidget {
//   NameWidget({
//     Key? key,
//     required this.scrollController,
//   }) : super(key: key);

//   final ScrollController scrollController;

//   @override
//   State<NameWidget> createState() => _NameWidgetState();
// }

// class _NameWidgetState extends State<NameWidget> {
//   double namePosition = 0;
//   double designationPosition = 0;
//   double nameWidgetWidth = 500;
//   double nameWidgetHeight = 70;
//   double fontSize = 50;
//   double actualFontSize = 50;
//   double actualNameWidgetWidth = 500;
//   double actualNameWidgetHeight = 70;

  // final GlobalKey widgetKey = GlobalKey();
  // final GlobalKey nameKey = GlobalKey();

//   double itemWidth = 0;
//   double itemHeight = 0;
//   Offset itemOffset = const Offset(0, 0);

  // void _getWidgetInfo() {
  //   final RenderBox renderBox =
  //       widgetKey.currentContext?.findRenderObject() as RenderBox;

  //   final RenderBox nameRenderBox =
  //       nameKey.currentContext?.findRenderObject() as RenderBox;

  //   final Offset nameOffset = nameRenderBox.localToGlobal(Offset.zero);

  //   final Size widgetSize = renderBox.size;
  //   itemWidth = widgetSize.width;
  //   itemHeight = widgetSize.height;
  //   print("item height $itemHeight");
  //   final Offset offset = renderBox.localToGlobal(Offset.zero);
  //   itemOffset = offset;
  //   setState(() {
  //     namePosition = offset.dy;
  //     designationPosition = offset.dy + itemHeight / 7;
  //     // print("position of sai first $namePosition");
  //   });
  //   // print(
  //   //     'Position: ${(offset.dx + widgetSize.width) / 2}, ${(offset.dy + widgetSize.height) / 2}');
  // }

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       _getWidgetInfo();
//       widget.scrollController.addListener(
//         () {
//           final scrollOffset = widget.scrollController.offset;
//           // print("scrool offset $scrollOffset");
//           // print("itemOffest $itemOffset");
//           // if (scrollOffset >= itemOffset.dy) {
//           nameWidgetHeight = actualNameWidgetHeight + scrollOffset;
//           nameWidgetWidth = actualNameWidgetWidth + (scrollOffset * 5);

//           fontSize = actualFontSize + (scrollOffset / 3);
//           // }
//           setState(() {
//             namePosition = scrollOffset + itemOffset.dy;
//             designationPosition = scrollOffset + itemHeight / 7 + itemOffset.dy;
//             print("position of sai $namePosition");
//           });
//           // }
//         },
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print(position.value);
//     final double deviceHeight = MediaQuery.of(context).size.height;
//     final double deviceWidth = MediaQuery.of(context).size.width;

//     return SizedBox(
//       key: widgetKey,
//       height: deviceHeight * 2,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Positioned(
//             top: namePosition,
//             width: deviceWidth > Constants.tablet
//                 ? (deviceWidth * 2)
//                 : (deviceWidth * 10),
//             height: deviceHeight,
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: SizedBox(
//                     key: nameKey,
//                     width: nameWidgetWidth,
//                     height: nameWidgetHeight,
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: ShaderMask(
//                         shaderCallback: (Rect bounds) {
//                           return const LinearGradient(
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               Colors.black,
//                               Colors.deepPurpleAccent,
//                               Colors.redAccent,
//                               Colors.blueAccent,
//                               Colors.cyan,
//                               Colors.teal
//                             ],
//                           ).createShader(bounds);
//                         },
//                         child: Align(
//                           alignment: Alignment.topCenter,
//                           child: Stack(
//                             children: [
//                               MyText(
//                                 "Sai Zayar Htet",
//                                 textOverflow: TextOverflow.fade,
//                                 textAlign: TextAlign.center,
//                                 style: FontUtils.getHeader1.copyWith(
//                                     fontSize: fontSize,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w800),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: designationPosition,
//             child: SizedBox(
//               width: itemWidth,
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 60),
//                   child: MyText(
//                     "A Flutter Developer",
//                     style: FontUtils.getHeader1
//                         .copyWith(fontSize: 30, fontWeight: FontWeight.w800),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
