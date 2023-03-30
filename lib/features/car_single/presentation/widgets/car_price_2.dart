import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class CarsPrice2 extends StatelessWidget {
  final String date;
  final String totalPrice;
  final String price;
  final Color textColor;

  const CarsPrice2(
      {required this.date,
        required this.price,
        required this.totalPrice,
        required this.textColor});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.w400, fontSize: 14, color: grey),
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              price,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).extension<ThemedColors>()!.blackToWhite,),
            ),
            const SizedBox(width: 8),
            Text(
              totalPrice,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).extension<ThemedColors>()!.blackToWhite,),
              maxLines: 1,
            ),
          ],
        ),
      ],
    ),
  );
}
