import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class CarsPrice extends StatelessWidget {
  final String date;
  final String totalPrice;
  final String price;

  const CarsPrice(
      {required this.date, required this.price, required this.totalPrice});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w400, fontSize: 14, color: grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: profileContainers),
                ),
                Text(
                  totalPrice,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: profileContainers),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
  );
}