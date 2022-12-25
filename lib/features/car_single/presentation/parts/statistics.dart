import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarStatistics extends StatelessWidget {
  final String date;
  final String views;
  final String id;

  CarStatistics({
    Key? key,
    required this.date,
    required this.views,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.calendar,
                      color: const Color(0xffB5B5BE),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      DateFormat('d MMMM yyyy').format(DateTime.parse(date)),
                      style: const TextStyle(
                        color: suvaGray,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.eye2,
                      color: const Color(0xffB5B5BE),
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      views,
                      style: const TextStyle(
                        color: suvaGray,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppIcons.id,
                  color: const Color(0xffB5B5BE),
                  width: 24,
                  height: 24,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  id,
                  style: const TextStyle(
                    color: suvaGray,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
