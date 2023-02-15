import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DealerTime extends StatelessWidget {
  final String timeFrom;
  final String timeTo;

  const DealerTime({
    required this.timeFrom,
    required this.timeTo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    LocaleKeys.avialable_hours.tr(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(
                      AppIcons.close,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.the_user_is_only_available_in.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: profileContainers),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: orange.withOpacity(
                        0.2,
                      ),
                    ),
                    child: Text(
                      '${LocaleKeys.from.tr()} $timeFrom' ' - ${LocaleKeys.to.tr()} $timeTo',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: orange),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  OrangeButton(
                    shadowColor: orange.withOpacity(0.2),
                    color: orange,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    content: Text(
                      LocaleKeys.understandably.tr(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: white,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
}
