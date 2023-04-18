// ignore_for_file: type_annotate_public_apis

import 'dart:io';

import 'package:auto/features/ad/presentation/pages/preview/widgets/image_indicator.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/view_360_screen.dart';
import 'package:auto/features/car_single/presentation/widgets/more_container.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final List<String> images;
  final List<String> panoramaImages;

  const ImageViewer({required this.images, this.panoramaImages = const [], Key? key}) : super(key: key);

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
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
                itemCount: widget.panoramaImages.isNotEmpty ? widget.images.length + 1 : widget.images.length,
                itemBuilder: (context, index) {
                  if (index == widget.images.length) {
                    return Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(fade(page: View360Screen(images: widget.panoramaImages)));
                        },
                        child: const Text('Open 360 view'),
                      ),
                    );
                  }
                  return SizedBox(
                    width: double.infinity,
                    child: widget.images[index].startsWith('http')
                        ? CachedNetworkImage(
                            imageUrl: widget.images[index],
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(widget.images[index]),
                            fit: BoxFit.cover,
                          ),
                  );
                },
              ),
            ),
            if (widget.images.length > 1)
              Positioned(
                bottom: 12,
                left: 14,
                right: 14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Row(
                        children: List.generate(
                          widget.panoramaImages.isNotEmpty ? widget.images.length + 1 : widget.images.length,
                          (index) => MoreContainer(
                            itemQuantity:
                                widget.panoramaImages.isNotEmpty ? widget.images.length + 1 : widget.images.length,
                            color: index == currentIndex ? Colors.white : const Color(0xFFB5B5BE),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
}
