import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedCarInfo extends StatelessWidget {
  const SelectedCarInfo({super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: border, width: 1),
            borderRadius: BorderRadius.circular(12),
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.05),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/car_single/car_single300kb.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            ExpansionTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Общая оценка',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset(AppIcons.star),
                  const SizedBox(width: 8),
                  Text(
                    '3.6',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
              subtitle: Text(
                'По 16 отзывам',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: grey,
                    ),
              ),
            ),
            const Divider(
                indent: 12, color: dividerColor, thickness: 1, height: 1),
            ExpansionTile(
              title: Row(
                children: [
                  Text(
                    'Плюсы и минусы',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(AppIcons.plusMinus)
                ],
              ),
              subtitle: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '7',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: green,
                          ),
                    ),
                    TextSpan(
                      text: '/',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: dividerColor,
                          ),
                    ),
                    TextSpan(
                      text: '1',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: red,
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
