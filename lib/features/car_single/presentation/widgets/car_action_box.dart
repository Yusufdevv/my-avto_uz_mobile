import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/domain/entities/car_statistic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarActionsBox extends StatelessWidget {
  final CarStatistic carStatistic;
  const CarActionsBox({Key? key,required this.carStatistic}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              carStatistic.icon,
              height: 28,
              width: 28,color: darkGray,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
             carStatistic.valueText,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 12,color: darkGray),
            )
          ],
        ),
      );
}
