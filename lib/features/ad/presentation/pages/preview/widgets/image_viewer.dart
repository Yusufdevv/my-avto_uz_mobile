import 'dart:io';

import 'package:auto/features/ad/presentation/pages/preview/widgets/image_indicator.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final List<String> images;

  const ImageViewer({required this.images, Key? key}) : super(key: key);

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late PageController pageController;
  var indicator = const ImageIndicator(
    isActive: true,
  );
  var indicator2 = const ImageIndicator(
    isActive: false,
  );

  int currentIndex = 0;
  bool isVisible = false;

  List<Widget> buildIndicator() {
    final indicators = <Widget>[];
    for (var i = 0; i < widget.images.length; i++) {
      visibility();
      if (currentIndex == i) {
        indicators.add(indicator);
      } else {
        indicators.add(indicator2);
      }
    }
    return indicators;
  }

  void visibility() {
    setState(() {
      if (currentIndex == 1) {
        isVisible = true;
      } else {
        isVisible = false;
      }
    });
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 311,
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                controller: pageController,
                onPageChanged: (page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
                children: List.generate(
                  widget.images.length,
                  (index) => SizedBox(
                    width: double.infinity,
                    child: widget.images[index].startsWith('http')
                        ? Image.network(
                            widget.images[index],
                            fit: BoxFit.cover,
                          )
                        : Image.file(File(widget.images[index]),fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildIndicator(),
              ),
            ),
          ],
        ),
      );
}
