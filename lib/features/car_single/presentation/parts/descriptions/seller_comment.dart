import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

String text =
    'ФИНАЛЬНАЯ ЦЕНА за НАЛИЧНЫЙ РАСЧЕТ 2 879 000 сум. Автомобиль в безупречном состоянии! Без дтп! По регистрациям, были перевесы Гос номеров, прослеживается по истории владения. Оригинальный пробег. Полный комплект Ключей и документов к автомобилю!';

class SellerComment extends StatelessWidget {
  const SellerComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(right: 32),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Комментарий продавца',
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
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 14,color: grey),
            )
          ],
        ),
      );
}
