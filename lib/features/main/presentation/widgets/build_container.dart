import 'package:flutter/material.dart';

class BuildContainer extends StatelessWidget {
  final double width;
  final Color color;
  const BuildContainer({required this.color, required this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: 5,
    width: width,
      decoration:  BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3)
      ),
    );
}
