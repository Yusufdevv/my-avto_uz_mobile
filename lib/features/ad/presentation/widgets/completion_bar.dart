import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
  Widget build(BuildContext context) => AnimatedContainer(
        alignment: Alignment.centerLeft,
        height: 2,
        width: screenWidth,
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        duration: const Duration(milliseconds: 500),
        child: visibile
            ? Container(
                height: 2,
                width: (screenWidth / totalSteps) * currentStep,
                color: progressBarColor,
              )
            : null,
      );
}
