import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class CompletionBar extends StatelessWidget {
  final double screenWidth;
  final int currentStep;
  final int totalSteps;
  final Color progressBarColor;
  final bool visibile;

  const CompletionBar(
      {required this.screenWidth,
      required this.totalSteps,
      required this.currentStep,
      required this.progressBarColor,
      required this.visibile,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => visibile
      ? AnimatedContainer(
          alignment: Alignment.centerLeft,
          height: 2,
          width: currentStep * (screenWidth / totalSteps),
          color:progressBarColor,
          duration: const Duration(milliseconds: 200),
        )
      : Container(
          height: 2,
          color: white,
          width: screenWidth,
        );
}
