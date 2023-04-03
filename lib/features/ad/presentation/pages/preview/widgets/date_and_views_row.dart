import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateAndViewsRow extends StatelessWidget {
  const DateAndViewsRow({
    required this.date,
    Key? key,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.calendar, color: greyText),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12, color: warmerGrey),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.eye,
                  color: greyText,
                ),
                const SizedBox(width: 8),
                Text(
                  '0',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12, color: warmerGrey),
                ),
              ],
            ),
          ],
        ),
      );
}
