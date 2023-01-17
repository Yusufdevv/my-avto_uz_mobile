import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/widgets/call_like_item.dart';
import 'package:flutter/material.dart';

class DayLikeCallItem extends StatelessWidget {
  final int days;
  final int likes;
  final int calls;
  final int leftDays;

  const DayLikeCallItem(
      {Key? key, required this.days, required this.likes, required this.calls, required this.leftDays})
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
                  number: '${days}',
                  text: '    Дней \nв продаже',
                ),
                CallLikeItem(
                  icon: AppIcons.heart,
                  number: '${likes}',
                  text: ' Добавили в  \n  избранное',
                ),
                CallLikeItem(
                  icon: AppIcons.phoneCall,
                  number: '${calls}',
                  text: 'Позвонили по \n    телефону',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
              margin: EdgeInsets.only(top: 16, bottom: 16),
              decoration: BoxDecoration(
                color: const Color(0xffFFFBFA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'До окончания срока объявления',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(0xff92929D)),
                  ),
                  Row(
                    children: [
                      Text(
                        'осталось: ',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: const Color(0xff92929D)),
                      ),
                      Text(
                        '${leftDays} дня',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: const Color(0xffEA5930)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
}
