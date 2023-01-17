import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RentToSaleDetailsBox extends StatelessWidget {
  const RentToSaleDetailsBox({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
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
                      .headline1!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8, right: 12),
                    child: SvgPicture.asset(AppIcons.editProfile))
              ],
            ),
            const SizedBox(height: 16),
            const TextInRow(
              title: 'Предоплата',
              info: '12 000',
            ),
            const SizedBox(height: 12),
            const Divider(color: border, height: 1),
            const SizedBox(height: 8),
            const TextInRow(
              title: 'Срок аренды в месяцах',
              info: '12 000',
            ),
            const SizedBox(height: 12),
            const Divider(color: border, height: 1),
            const SizedBox(height: 8),
            const TextInRow(
              title: 'Платеж в меяц',
              info: '12 000',
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
            style: Theme.of(context).textTheme.headline2,
          ),
          const Spacer(),
          Text(
            info,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 12),
        ],
      );
}
