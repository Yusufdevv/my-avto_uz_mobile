import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({Key? key}) : super(key: key);

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
        Text(LocaleKeys.order_details.tr(), style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),),
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.receipt.tr(), style: Theme.of(context).textTheme.bodyText1!.copyWith(color: grey),),
            Text('ул. Байналминал 23', style: Theme.of(context).textTheme.headline6!.copyWith(color: greyText, fontSize: 12),),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.returner.tr(), style: Theme.of(context).textTheme.bodyText1!.copyWith(color: grey),),
            Text('ул. Байналминал 56', style: Theme.of(context).textTheme.headline6!.copyWith(color: greyText, fontSize: 12),),
          ],
        ),
       const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.rent_periodic.tr(), style: Theme.of(context).textTheme.bodyText1!.copyWith(color: grey),),
            Text('10.03.2022, 10:00 - 24.03.2022, 12:00', style: Theme.of(context).textTheme.headline6!.copyWith(color: greyText, fontSize: 12),),
          ],
        ),
      ],
    ),
  );
}
