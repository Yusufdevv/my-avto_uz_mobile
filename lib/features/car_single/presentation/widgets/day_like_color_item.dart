import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/widgets/call_like_item.dart';
import 'package:flutter/material.dart';

class DayLikeCallItem extends StatelessWidget {
  final String days;
  final String likes;
  final String calls;

  const DayLikeCallItem(
      {Key? key, required this.days, required this.likes, required this.calls})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CallLikeItem(
                  icon: AppIcons.calendar,
                  number: days,
                  text: '    Дней \nв продаже',
                ),
                CallLikeItem(
                  icon: AppIcons.heart,
                  number: likes,
                  text: ' Добавили в  \n  избранное',
                ),
                CallLikeItem(
                  icon: AppIcons.phoneCall,
                  number: calls,
                  text: 'Позвонили по \n    телефону',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
          ],
        ),
      );
}