import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/dealers/presentation/pages/image_in_full_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedImages extends StatefulWidget {
  final double screenWidth;
  final List<String> images;

  const AnimatedImages({
    required this.screenWidth,
    required this.images,
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

  @override
  void initState() {
    _pageController = PageController();
    screenWidth = widget.screenWidth;
    leftSideOfPageView = screenWidth / 3;
    rightSideOfPageView = screenWidth * 2 / 3;
    widthOfIndicator =
        (screenWidth - 4 * widget.images.length - 44) / widget.images.length;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation =
        Tween(begin: 0.0, end: widthOfIndicator).animate(_animationController);
    _animationController
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.forward();
          if (page < widget.images.length - 1) {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
          } else {
            _pageController.animateToPage(0,
                duration: const Duration(milliseconds: 200),
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
        child: Stack(
          children: [
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
                  if (page < widget.images.length - 1) {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 50),
                        curve: Curves.linear);
                  } else {
                    _pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 50),
                        curve: Curves.bounceOut);
                  }
                } else {
                  if (widget.images.isNotEmpty) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ImageInFullScreen(
                              images: widget.images,
                            )));
                  }
                }
              },
              child:
                  //   child: PageView(
                  //     onPageChanged: (integer) {
                  //       page = integer;
                  //       _animationController.forward(from: 0);
                  //     },
                  //     controller: _pageController,
                  //     children: List.generate(
                  //       widget.images.length,
                  //       (index) => CachedNetworkImage(
                  //         imageUrl: widget.images[index],
                  //         imageBuilder: (context, imageProvider) => Container(
                  //           decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //                 image: imageProvider, fit: BoxFit.cover),
                  //           ),
                  //         ),
                  //         placeholder: (context, url) =>
                  //             const CircularProgressIndicator(),
                  //         errorWidget: (context, url, error) =>
                  //             SvgPicture.asset(AppImages.autoUz),
                  //       ),
                  //       // (index) => Container(
                  //       //   decoration: BoxDecoration(
                  //       //     shape: BoxShape.rectangle,
                  //       //   ),
                  //       //   color: images[index],
                  //       // ),
                  //     ),
                  //   ),
                  // ),
                  PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) => setState(() {
                            page = value;
                          }),
                      itemCount:
                          widget.images.isEmpty ? 1 : widget.images.length,
                      itemBuilder: (context, index) => Container(
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.center,
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0),
                                ],
                              ),
                            ),
                            child: widget.images.isEmpty
                                ? Image.asset(
                                    AppImages.defaultPhoto,
                                    fit: BoxFit.cover,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: widget.images[index],
                                    width: double.maxFinite,
                                    height: 340,
                                    fit: BoxFit.cover),
                          )),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 36,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeContainerToBlack,
              ),
            ),
            Positioned(
              top: 48,
              left: 20,
              child: Row(
                children: List.generate(
                  widget.images.length,
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
                        ),
                      },
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
