import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PriceStatisticItem extends StatefulWidget {
  final double percent;
  final String price;
  final String currency;

  PriceStatisticItem({
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

  Color itemColor = Colors.green;

  late String icon;

  double getPointleft(double percent) {
    if (percent == null) {
      itemColor = Colors.green;
      alighment = CrossAxisAlignment.start;
      icon = AppImages.one_nice;
      return 0.3;
    }
    if (percent <= 90) {
      itemColor = Colors.green;
      alighment = CrossAxisAlignment.start;
      icon = AppImages.one_nice;
      return 0.07;
      // ignore: invariant_booleans
    } else if (percent > 90 && percent < 94) {
      itemColor = Colors.green;
      alighment = CrossAxisAlignment.center;
      icon = AppImages.nice_two;
      return 0.080;
    } else if (percent >= 94 && percent < 98) {
      itemColor = Colors.green;
      icon = AppImages.nice_three;
      alighment = CrossAxisAlignment.center;
      return 0.2;
    } else if (percent >= 98 && percent < 100) {
      itemColor = Colors.blue;
      icon = AppImages.optima_one;
      alighment = CrossAxisAlignment.center;
      return 0.3;
    } else if (percent == 100) {
      icon = AppImages.optima_two;
      itemColor = Colors.blue;
      alighment = CrossAxisAlignment.center;
      return 0.4;
    } else if (percent >= 101 && percent < 103) {
      itemColor = Colors.blue;
      icon = AppImages.optima_three;
      alighment = CrossAxisAlignment.end;
      return 0.45;
    } else if (percent >= 103 && percent < 107) {
      itemColor = Colors.red;
      alighment = CrossAxisAlignment.end;
      icon = AppImages.bad_one;
      return 0.52;
    } else if (percent >= 107 && percent < 110) {
      icon = AppImages.bad_two;
      itemColor = Colors.red;
      alighment = CrossAxisAlignment.end;
      return 0.62;
    } else if (percent > 100) {
      icon = AppImages.bad_three;
      itemColor = Colors.red;
      alighment = CrossAxisAlignment.end;
      return 0.74;
    }
    return 0;
  }

  @override
  void initState() {
    getPointleft(widget.percent);
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
  Widget build(BuildContext context) {
    print('====${widget.percent}');
    print('icon:$icon');
    return Stack(
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
                  // Row(
                  //   children: [
                  //     // Container(
                  //     //   width: MediaQuery.of(context).size.width * .3,
                  //     //   alignment: Alignment.center,
                  //     //   child: Text(
                  //     //     LocaleKeys.excellent.tr(),
                  //     //     style: Theme.of(context)
                  //     //         .textTheme
                  //     //         .displayLarge!
                  //     //         .copyWith(
                  //     //             fontSize: 16, fontWeight: FontWeight.w600),
                  //     //     textAlign: TextAlign.center,
                  //     //   ),
                  //     // ),
                  //     const Spacer(),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width * .3,
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         LocaleKeys.optimal.tr(),
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .displayLarge!
                  //             .copyWith(
                  //                 fontSize: 16, fontWeight: FontWeight.w600),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //     const Spacer(),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width * .3,
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         LocaleKeys.overpriced.tr(),
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .displayLarge!
                  //             .copyWith(
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height *
                  getPointTop(widget.percent),
              left: MediaQuery.of(context).size.width *
                  getPointleft(widget.percent),
              child: Column(
                //  crossAxisAlignment: alighment,
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
                  // Container(
                  //   height: 16,
                  //   width: 16,
                  //   decoration: BoxDecoration(
                  //     color: white,
                  //     borderRadius: BorderRadius.circular(50),
                  //     border: Border.all(color: Colors.red, width: 2),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
