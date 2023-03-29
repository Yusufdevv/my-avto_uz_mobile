import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class CarInfoRow extends StatelessWidget {
  final String title;
  final String info;
  const CarInfoRow({
    required this.info,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 35,
              child: Row(
                children: [
                  Text(title, style: Theme.of(context).textTheme.displayMedium!.copyWith(color:  greyText)),
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(top: 13),
                          height: 1,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .divider,)),
                ],
              ),
            ),
            Expanded(
              flex: 20,
              child: Text(info,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: greyText)),
            ),
          ],
        ),
      );
}
