import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class CharacteristicBox extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const CharacteristicBox(
      {required this.color, required this.title, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        //height: 52,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: grey,
                  ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Theme.of(context).extension<ThemedColors>()!.darkToWhite,
                  ),
            ),
          ],
        ),
      );
}
