import 'package:flutter/material.dart';

class MoreContainer extends StatelessWidget {
  final int itemQuantity;
  final Color color;

  const MoreContainer(
      {super.key, required this.color, required this.itemQuantity});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: 4,
        width: (width - 28 - itemQuantity * 4) / itemQuantity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
