import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarksWithAnnouncements extends StatelessWidget {
  final String mark;
  final int quantity;
  final String imageUrl;
  const MarksWithAnnouncements({
    Key? key,
    required this.mark,
    required this.quantity,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 96,
              height: 64,
              decoration: BoxDecoration(
                border: Border.all(color: solitude),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(imageUrl),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  mark,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '($quantity)',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
