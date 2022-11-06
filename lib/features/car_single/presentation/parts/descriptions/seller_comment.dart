import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

String text =
    'ФИНАЛЬНАЯ ЦЕНА за НАЛИЧНЫЙ РАСЧЕТ 2 879 000 сум. Автомобиль в безупречном состоянии! Без дтп! По регистрациям, были перевесы Гос номеров, прослеживается по истории владения. Оригинальный пробег. Полный комплект Ключей и документов к автомобилю!';

class SellerComment extends StatelessWidget {
  const SellerComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).extension<ThemedColors>()!.solitudeToDarkRider,
        ),
        color: Theme.of(context).extension<ThemedColors>()!.whiteToNero
    ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.sellers_comment.tr(),
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
            ),
          const  SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 14,color: profileContainers),
            )
          ],
        ),
      );
}
