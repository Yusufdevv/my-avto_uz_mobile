import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarSellerCard extends StatelessWidget {
  const CarSellerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: dark1,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Продавец авто',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(height: 44,width: 44,
                  child: CircleAvatar(
                    radius: 16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(AppImages.audi,),
                    ),
                  ),
                ),

                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Анвар Гулямов',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Частное лицо',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color(0xff695CEA)),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: background,
                  border: Border.all(color: strokeDark)),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(12, 12, 0, 12),
                    child: Row(
                      children: [
                        Text(
                          'Участие в ДТП:',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: green),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 8),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.safe,
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Не обнаружено',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      right: -15,
                      bottom: -10,
                      child: Image.asset(
                        AppImages.carCrashed,
                        width: 105,
                        height: 48,
                      )),
                ],
              ),
            )
          ],
        ),
      );
}
