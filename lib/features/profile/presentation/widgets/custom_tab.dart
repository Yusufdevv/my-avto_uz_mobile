import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String title;
  final bool isLastItem;

  const CustomTab({
    required this.title,
    this.isLastItem = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          if (!isLastItem) ...{
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 0.65,
                color: dividerInTab)
          }
        ],
      );
}
