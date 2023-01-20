import 'package:auto/assets/constants/images.dart';
import 'package:flutter/material.dart';

class PriceStatisticItem extends StatelessWidget {
  final String priceStatus = 'nice';

  const PriceStatisticItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                Image.asset(
                  AppImages.one_nice,
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
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      'Оптимальная',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      'Завышенная',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ],
      );
}
