import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  final String receiptingAddress;
  final String returnigAddress;
  final String fromDate;
  final String toDate;
  const DetailsItem(
      {required this.fromDate,
      required this.toDate,
      required this.receiptingAddress,
      required this.returnigAddress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.order_details.tr(),
              style:
                  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 12,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       LocaleKeys.receipt.tr(),
            //       style: Theme.of(context)
            //           .textTheme
            //           .bodyLarge!
            //           .copyWith(color: grey),
            //     ),
            //     Text(
            //       receiptingAddress,
            //       style: Theme.of(context)
            //           .textTheme
            //           .titleLarge!
            //           .copyWith(color: greyText, fontSize: 12),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 8,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       LocaleKeys.returner.tr(),
            //       style: Theme.of(context)
            //           .textTheme
            //           .bodyLarge!
            //           .copyWith(color: grey),
            //     ),
            //     Text(
            //       returnigAddress,
            //       style: Theme.of(context)
            //           .textTheme
            //           .titleLarge!
            //           .copyWith(color: greyText, fontSize: 12),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 8,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.rent_periodic.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: grey),
                ),
                Text(
                  '$fromDate - $toDate',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: greyText, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      );
}
