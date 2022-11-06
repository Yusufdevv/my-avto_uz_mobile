import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final Widget content;

  const OrangeButton({required this.content});

  @override
  Widget build(BuildContext context) => WScaleAnimation(
      onTap: (){},
      child: Container(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        decoration: BoxDecoration(
          color: orange,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: content,
        ),
      ),
    );
}


