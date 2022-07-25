import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({this.isActive = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width:isActive ? 8 : 8,
      decoration: BoxDecoration(
        color: isActive ? orange : orange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
    );
}
