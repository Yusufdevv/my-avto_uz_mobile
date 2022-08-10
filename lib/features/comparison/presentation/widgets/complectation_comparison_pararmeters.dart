import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ComplectationComparisonWidget extends StatelessWidget {
  final String status;
  final String parameterName;
  final int numberOfCars;
  final Color color;
  const ComplectationComparisonWidget({
    required this.color,
    required this.parameterName,
    required this.numberOfCars,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              parameterName,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: grey,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (status == 'good')
                  SvgPicture.asset(AppIcons.statusGood)
                else
                  SvgPicture.asset(AppIcons.statusNotGood),
                if (numberOfCars == 1)
                  SizedBox()
                else
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: status == 'good'
                        ? SvgPicture.asset(AppIcons.statusGood)
                        : SvgPicture.asset(AppIcons.statusNotGood),
                  ),
              ],
            )
          ],
        ),
      );
}
