import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:flutter/material.dart';
class PriceStatisticItem extends StatefulWidget {
  final double percent;
  final String price;
  final String currency;

  const PriceStatisticItem({
    required this.percent,
    required this.price,
    required this.currency,
    Key? key,
  }) : super(key: key);

  @override
  State<PriceStatisticItem> createState() => _PriceStatisticItemState();
}

class _PriceStatisticItemState extends State<PriceStatisticItem> {
  CrossAxisAlignment alighment = CrossAxisAlignment.start;

  late double pointLeft;
  late String icon;

  double getPointleft(double? percent) {
    if (percent == null) {
      alighment = CrossAxisAlignment.start;
      icon = AppImages.one_nice;
      return 0.3;
    }
    if (percent <= 90) {
      alighment = CrossAxisAlignment.start;
      icon = AppImages.one_nice;
      return 0.07;
      // ignore: invariant_booleans
    } else if (percent > 90 && percent < 94) {
      alighment = CrossAxisAlignment.center;
      icon = AppImages.nice_two;
      return 0.080;
    } else if (percent >= 94 && percent < 98) {
      icon = AppImages.nice_three;
      alighment = CrossAxisAlignment.center;
      return 0.2;
    } else if (percent >= 98 && percent < 100) {
      icon = AppImages.optima_one;
      alighment = CrossAxisAlignment.center;
      return 0.3;
    } else if (percent == 100) {
      icon = AppImages.optima_two;

      alighment = CrossAxisAlignment.center;
      return 0.4;
    } else if (percent >= 101 && percent < 103) {
      icon = AppImages.optima_three;
      alighment = CrossAxisAlignment.end;
      return 0.45;
    } else if (percent >= 103 && percent < 107) {
      alighment = CrossAxisAlignment.end;
      icon = AppImages.bad_one;
      return 0.52;
    } else if (percent >= 107 && percent < 110) {
      icon = AppImages.bad_two;

      alighment = CrossAxisAlignment.end;
      return 0.62;
    } else if (percent > 100) {
      icon = AppImages.bad_three;

      alighment = CrossAxisAlignment.end;
      return 0.74;
    }
    return 0;
  }

  @override
  void initState() {
    pointLeft = getPointleft(widget.percent);
    super.initState();
  }

  double getPointRight(double percent) {
    if (percent >= 103 && percent < 107) {
      alighment = CrossAxisAlignment.end;
      return 0.07;
    } else if (percent >= 107 && percent < 110) {
      alighment = CrossAxisAlignment.end;
      return 0.080;
    } else if (percent > 100) {
      alighment = CrossAxisAlignment.end;
      return 0.2;
    }
    return 0;
  }

  double getPointTop(double percent) {
    if (percent <= 90) {
      return 0.125;
    } else if (percent > 90 && percent < 94) {
      return 0.113;
    } else if (percent >= 94 && percent < 98) {
      return 0.111;
    } else if (percent >= 98 && percent < 100) {
      return 0.105;
    } else if (percent == 100) {
      return 0.095;
    } else if (percent >= 101 && percent < 103) {
      return 0.073;
    } else if (percent >= 103 && percent < 107) {
      return 0.060;
    } else if (percent >= 107 && percent < 110) {
      return 0.035;
    } else if (percent > 110) {
      return 0.001;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) => Stack(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Image.asset(icon, fit: BoxFit.cover, width: double.infinity),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height *
                  getPointTop(widget.percent),
              left: MediaQuery.of(context).size.width * pointLeft,
              child: Column(
                children: [
                  Text(
                    '${widget.price} ${widget.currency}',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: dark,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ],
    );
}
