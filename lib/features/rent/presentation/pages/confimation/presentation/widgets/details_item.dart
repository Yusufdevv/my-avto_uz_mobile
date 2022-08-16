import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
        Text('Детали заказа', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),),
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Получение', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: grey),),
            Text('ул. Байналминал 23', style: Theme.of(context).textTheme.headline6!.copyWith(color: greyText, fontSize: 12),),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Возврат', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: grey),),
            Text('ул. Байналминал 56', style: Theme.of(context).textTheme.headline6!.copyWith(color: greyText, fontSize: 12),),
          ],
        ),
       const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Период аренды', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: grey),),
            Text('10.03.2022, 10:00 - 24.03.2022, 12:00', style: Theme.of(context).textTheme.headline6!.copyWith(color: greyText, fontSize: 12),),
          ],
        ),
      ],
    ),
  );
}
