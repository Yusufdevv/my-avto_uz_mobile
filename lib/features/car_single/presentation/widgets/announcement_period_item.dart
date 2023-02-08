import 'package:flutter/material.dart';

class AnnouncementPeriodItem extends StatelessWidget {
  final String days;

  const AnnouncementPeriodItem({
    required this.days,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: const Color(
            0xffFFFBFA,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
            text: 'До окончания срока объявления \nосталось: ',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color(
                    0xff92929D,
                  ),
                ),
          ),
          TextSpan(
            text: days,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color(
                    0xffEA5930,
                  ),
                ),
          ),
        ])),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Text(
        //       'До окончания срока объявления \nосталось:',
        //       style: Theme.of(context).textTheme.headline1!.copyWith(
        //             fontWeight: FontWeight.w600,
        //             fontSize: 16,
        //             color: const Color(
        //               0xff92929D,
        //             ),
        //           ),
        //     ),
        //     Text(

        //     ),
        //   ],
        // ),
      );
}
