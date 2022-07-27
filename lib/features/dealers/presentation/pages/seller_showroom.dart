import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../assets/colors/color.dart';

class SellerShowroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            const ImageUpdating(),
            const Positioned(
              top: 48,
              left: 20,
              child: SizedBox(),
            ),
            Positioned(
              bottom: -36,
              right: 20,
              left: 20,
              child: Container(
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      children: const [
                        Text('data'),
                        Text('data'),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
}

class ImageUpdating extends StatefulWidget {
  const ImageUpdating();
  @override
  State<ImageUpdating> createState() => _ImageUpdatingState();
}

class _ImageUpdatingState extends State<ImageUpdating>
    with SingleTickerProviderStateMixin {
  List<Container> images = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    )
  ];
  late PageController _pageController;
  late AnimationController _animationController;
  int pagenumber = 0;
  @override
  void initState() {
    _pageController = PageController();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    //  pagenumber == 0 ? pagenumber = 1 : pagenumber = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 260,
        child: PageView.builder(
          itemCount: images.length,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) => images[i],
        ),
      );
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 30,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: white,
        ),
      );
}

// class Row
// {
//   Row(
//   children: images
//       .asMap()
//       .map((i, e) => MapEntry(i, const AnimatedBar()))
//       .values
//       .toList())
// }
