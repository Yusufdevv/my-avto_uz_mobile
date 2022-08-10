import 'package:auto/features/dealers/presentation/pages/image_in_full_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../assets/themes/theme_extensions/themed_colors.dart';

class AnimatedImages extends StatefulWidget {
  final double screenWidth;
  const AnimatedImages({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedImages> createState() => _AnimatedImagesState();
}

class _AnimatedImagesState extends State<AnimatedImages>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late PageController _pageController;
  int page = 0;
  late double leftSideOfPageView;
  late double rightSideOfPageView;
  late double screenWidth;
  late double widthOfIndicator;
  late Animation<double> animation;
  List<Color> images = [
    Colors.green,
    Colors.black,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.white10,
    Colors.greenAccent,
  ];
  @override
  void initState() {
    _pageController = PageController();
    screenWidth = widget.screenWidth;
    leftSideOfPageView = screenWidth / 3;
    rightSideOfPageView = screenWidth * 2 / 3;
    widthOfIndicator = (screenWidth - 4 * images.length - 44) / images.length;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation =
        Tween(begin: 0.0, end: widthOfIndicator).animate(_animationController);
    _animationController
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.forward();
          if (page < images.length - 1) {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 50),
                curve: Curves.linear);
          } else {
            _pageController.animateToPage(0,
                duration: const Duration(milliseconds: 50),
                curve: Curves.bounceOut);
          }
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 260,
        child: Stack(children: [
          GestureDetector(
            onTapDown: (details) {
              if (details.localPosition.dx < leftSideOfPageView) {
                if (page == 0) {
                  _animationController.forward(from: 0.0);
                } else {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 50),
                      curve: Curves.linear);
                }
              } else if (details.localPosition.dx > rightSideOfPageView) {
                if (page < images.length - 1) {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 50),
                      curve: Curves.linear);
                } else {
                  _pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 50),
                      curve: Curves.bounceOut);
                }
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ImageInFullScreen()));
              }
            },
            child: PageView(
              onPageChanged: (integer) {
                page = integer;
                _animationController.forward(from: 0.0);
              },
              controller: _pageController,
              children: List.generate(
                images.length,
                (index) => Container(
                  color: images[index],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              color:
                  Theme.of(context).extension<ThemedColors>()!.solitudeTo1Black,
            ),
          ),
          Positioned(
            top: 48,
            left: 20,
            child: Row(
              children: List.generate(
                images.length,
                (index) => Stack(
                  children: [
                    Container(
                      margin: index == 0
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(left: 4),
                      height: 4,
                      decoration: BoxDecoration(
                          color: page > index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(2)),
                      width: widthOfIndicator,
                    ),
                    if (page == index) ...{
                      AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          margin: index == 0
                              ? EdgeInsets.zero
                              : const EdgeInsets.only(left: 4),
                          height: 4,
                          width: animation.value,
                        ),
                      )
                    }
                  ],
                ),
              ),
            ),
          )
        ]),
      );
}
