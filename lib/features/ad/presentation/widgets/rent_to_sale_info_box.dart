import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RentToSaleDetailsBox extends StatelessWidget {
  final String prePayment;
  final String monthlyPayment;
  final int rentalPeriod;
  final VoidCallback onTap;
  const RentToSaleDetailsBox({
    required this.onTap,
    required this.monthlyPayment,
    required this.prePayment,
    required this.rentalPeriod,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
        decoration: BoxDecoration(
            color: whiteToGrey, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Условия 1',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                WScaleAnimation(
                  onTap: onTap,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8, right: 12),
                      child: SvgPicture.asset(AppIcons.editProfile)),
                )
              ],
            ),
            const SizedBox(height: 16),
            TextInRow(
              title: 'Предоплата',
              info: prePayment,
            ),
            const SizedBox(height: 12),
            const Divider(color: border, height: 1),
            const SizedBox(height: 8),
            TextInRow(
              title: 'Срок аренды в месяцах',
              info: '$rentalPeriod',
            ),
            const SizedBox(height: 12),
            const Divider(color: border, height: 1),
            const SizedBox(height: 8),
            TextInRow(
              title: 'Платеж в меяц',
              info: monthlyPayment,
            ),
          ],
        ),
      );
}

class TextInRow extends StatelessWidget {
  final String title;
  final String info;
  const TextInRow({
    required this.info,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Spacer(),
          Text(
            MyFunctions.getFormatCost(info),
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 12),
        ],
      );
}
