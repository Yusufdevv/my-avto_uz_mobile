import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarsImageSlider extends StatefulWidget {
  const CarsImageSlider({Key? key}) : super(key: key);

  @override
  State<CarsImageSlider> createState() => _CarsImageSliderState();
}

class _CarsImageSliderState extends State<CarsImageSlider> {
  int currentIndex = 0;
  int itemCount = 3;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: CarouselSlider.builder(
                itemCount: itemCount,
                itemBuilder: (c, item, index) => Image.asset(
                      AppImages.defaultPhoto,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: double.infinity,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    })),
          ),
          Positioned(
            bottom: 12,
            right: 16,
            left: 16,
            child: Row(
              children: List.generate(
                itemCount == 1 ? 0 : itemCount,
                (index) => Expanded(
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(right: 4),
                    duration: const Duration(milliseconds: 300),
                    height: 4,
                    decoration: BoxDecoration(
                        color: currentIndex == index
                            ? white
                            : const Color(0xffB5B5BE),
                        borderRadius: BorderRadius.circular(2)),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
