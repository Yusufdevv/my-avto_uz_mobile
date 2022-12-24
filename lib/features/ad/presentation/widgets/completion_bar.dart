import 'package:flutter/material.dart';

class CompletionBar extends StatelessWidget {
  final double screenWidth;
  final int currentStep;
  final int totalSteps;
  final Color progressBarColor;

  const CompletionBar(
      {required this.screenWidth,
      required this.totalSteps,
      required this.currentStep,
      required this.progressBarColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        alignment: Alignment.centerLeft,
        height: 2,
        width: currentStep * (screenWidth / totalSteps),
        color: progressBarColor,
        duration: const Duration(milliseconds: 200),
      );
}
