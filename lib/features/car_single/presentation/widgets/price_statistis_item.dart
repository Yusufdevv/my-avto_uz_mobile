import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:flutter/material.dart';

class PriceStatisticItem extends StatelessWidget {
  final double percent;
  final String price;

  PriceStatisticItem({Key? key, required this.percent, required this.price})
      : super(key: key);

  CrossAxisAlignment alighment = CrossAxisAlignment.start;
  Color itemColor = Colors.green;

  double getPointleft(double percent) {
    if (percent == null) {
      itemColor = Colors.green;
      alighment = CrossAxisAlignment.start;
      return 0.3;
    }
    if (percent <= 90) {
      itemColor = Colors.green;
      alighment = CrossAxisAlignment.start;
      return 0.07;
    } else if (percent > 90 && percent < 94) {
      itemColor = Colors.green;
      alighment = CrossAxisAlignment.center;
      return 0.080;
    } else if (percent >= 94 && percent < 98) {
      itemColor = Colors.green;
      alighment = CrossAxisAlignment.center;
      return 0.2;
    } else if (percent >= 98 && percent < 100) {
      itemColor = Colors.blue;
      alighment = CrossAxisAlignment.center;
      return 0.3;
    } else if (percent == 100) {
      itemColor = Colors.blue;
      alighment = CrossAxisAlignment.center;
      return 0.4;
    } else if (percent >= 101 && percent < 103) {
      itemColor = Colors.blue;
      alighment = CrossAxisAlignment.end;
      return 0.45;
    } else if (percent >= 103 && percent < 107) {
      itemColor = Colors.red;
      alighment = CrossAxisAlignment.end;
      return 0.52;
    } else if (percent >= 107 && percent < 110) {
      itemColor = Colors.red;

      alighment = CrossAxisAlignment.end;
      return 0.62;
    } else if (percent > 100) {
      itemColor = Colors.red;
      alighment = CrossAxisAlignment.end;
      return 0.74;
    }
    return 0;
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
      return 0.117;
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
                      height: 20,
                    ),
                    Image.asset(
                      AppImages.price_cases,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          'Отличная',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Text(
                          'Оптимальная',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Text(
                          'Завышенная',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * getPointTop(percent),
                left: MediaQuery.of(context).size.width * getPointleft(percent),
                child: Column(
                  crossAxisAlignment: alighment,
                  children: [
                    Text(
                      '$price USD',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: dark,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
}
