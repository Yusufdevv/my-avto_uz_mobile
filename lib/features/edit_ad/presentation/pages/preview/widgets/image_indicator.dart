import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class ImageIndicator extends StatelessWidget {
  final bool isActive;

  const ImageIndicator({this.isActive = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 4,
        width: 30,
        decoration: BoxDecoration(
          color: isActive ? white : warmerGrey,
          borderRadius: BorderRadius.circular(2),
        ),
      );
}
