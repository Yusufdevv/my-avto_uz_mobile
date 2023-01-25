import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class RadioCircleWidget extends StatelessWidget {
  final bool selected;
  final Color color;
  const RadioCircleWidget(
      {required this.selected, this.color = purple, super.key});

  @override
  Widget build(BuildContext context) => selected
      ? Container(
          height: 24,
          width: 24,
          padding: const EdgeInsets.all(2.2),
          decoration: BoxDecoration(
              border: Border.all(color: color, width: 2.2),
              shape: BoxShape.circle),
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        )
      : Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: grey,
              width: 1.9,
            ),
          ),
        );
}
