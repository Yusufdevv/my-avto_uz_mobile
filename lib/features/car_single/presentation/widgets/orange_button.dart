import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final Widget content;
  final VoidCallback onTap;
  final Color color;

  const OrangeButton({required this.content, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: content,
          ),
        ),
      );
}
