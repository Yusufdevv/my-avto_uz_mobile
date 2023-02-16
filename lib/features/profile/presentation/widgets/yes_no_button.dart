import 'package:flutter/material.dart';

class YesNoButton extends StatelessWidget {
  final Color color;
  final Widget text;

  const YesNoButton({required this.color, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 44,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: text,
        ),
      );
}
