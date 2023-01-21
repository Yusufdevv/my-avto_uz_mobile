import 'package:flutter/material.dart';

class WarningCircleWidget extends StatelessWidget {
  final Color color;
  const WarningCircleWidget({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2.3,
              color: color,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 2.2),
              width: 2.4,
              height: 7,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(1.2)),
            ),
            Container(
              width: 2.4,
              height: 2.4,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(1.2)),
            ),
          ],
        ),
      );
}
