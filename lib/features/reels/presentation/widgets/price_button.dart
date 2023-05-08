import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceButton extends StatelessWidget {
  const PriceButton({
    required this.discount,
    required this.price,
    required this.currency,
    required this.announcementId,
    Key? key,
  }) : super(key: key);

  final String discount;
  final String price;
  final String currency;
  final int announcementId;

  @override
  Widget build(BuildContext context) {
    if (double.parse(discount) > 0.0) {
      return WScaleAnimation(
        onTap: () {
          Navigator.push(
              context, fade(page: CarSingleScreen(id: announcementId)));
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 8, 16),
          decoration: BoxDecoration(
            color: white.withOpacity(.6),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${MyFunctions.getFormatCost(price)} '
                '${currency.toUpperCase()}',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: black.withOpacity(.5),
                    ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    '${MyFunctions.getFormatCost((double.parse(price) - double.parse(discount)).toString())} '
                    '${currency.toUpperCase()}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 24, color: dark),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SizedBox(
                    height: 27,
                    width: 27,
                    child: Stack(
                      children: [
                        SvgPicture.asset(AppIcons.discountContainer),
                        Positioned(
                          left: 3,
                          right: 3,
                          top: 8,
                          bottom: 8,
                          child: Text(
                            '-${((double.parse(discount) / double.parse(price)) * 100).toString().split('.').first}%',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 8, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    AppIcons.chevronRight2,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return WButton(
        onTap: () {
          Navigator.push(
              context, fade(page: CarSingleScreen(id: announcementId)));
        },
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 55,
        borderRadius: 16,
        color: purple.withOpacity(.88),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${MyFunctions.getFormatCost((price).toString())} '
              '${currency.toUpperCase()}',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 24),
            ),
            const SizedBox(
              width: 4,
            ),
            SvgPicture.asset(
              AppIcons.chevronRight2,
            ),
          ],
        ),
      );
    }
  }
}
