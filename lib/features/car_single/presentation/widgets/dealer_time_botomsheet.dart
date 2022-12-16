import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DealerTime extends StatelessWidget {
  const DealerTime({Key? key}) : super(key: key);

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
                    'Доступные часы',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
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
                    'Пользователь доступен только в',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
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
                      'от 09:00 - до 09:00',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
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
                      'Понятно',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
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