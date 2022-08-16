import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PeriodHeader extends StatelessWidget {
  final String startDate;
  final String endDate;
  final String startHour;
  final String endHour;
  const PeriodHeader({required this.startHour, required this.endHour, required this.endDate, required this.startDate,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Получение',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 13),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    startDate,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    startHour,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 13),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Получение',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 13),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    endDate,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    endHour,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 13),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            width: 28,
          ),
          WScaleAnimation(
            child: SvgPicture.asset(
              AppIcons.close,
              width: 24,
              height: 24,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
}
