import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class PlusCircle extends StatelessWidget {
  const PlusCircle({super.key});

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        height: 26,
        width: 26,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: purple,
            )),
        child: Stack(alignment: Alignment.center, children: [
          Container(
            width: 10,
            height: 2,
            decoration: BoxDecoration(
              color: purple,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          Container(
            width: 2,
            height: 10,
            decoration: BoxDecoration(
              color: purple,
              borderRadius: BorderRadius.circular(1),
            ),
          )
        ]),
      );
}
