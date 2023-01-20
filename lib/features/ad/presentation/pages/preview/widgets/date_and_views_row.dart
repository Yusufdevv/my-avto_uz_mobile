import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/domain/entities/preview/preview_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateAndViewsRow extends StatelessWidget {
  const DateAndViewsRow({
    required this.previews,
    Key? key,
  }) : super(key: key);

  final List<PreviewEntity> previews;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.calendar),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  previews[0].date,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 12, color: suvaGray),
                ),
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Row(
              children: [
                SvgPicture.asset(AppIcons.eye),
                const SizedBox(
                  width: 8,
                ),
                Text(
                '0',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 12, color: suvaGray),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 12, color: suvaGray),
                ),
              ],
            ),
          ],
        ),
      );
}