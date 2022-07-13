import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  const Rate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
            border: Border.all(color: orange),
            borderRadius: BorderRadius.circular(12),
            color: white),
        child: Row(
          children: [
            Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Оцените',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                          text: '\nнас в App Store',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                WButton(
                  margin: const EdgeInsets.only(top: 12),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 46),
                  onTap: () {},
                  child: Text(
                    'Оценить',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            const Spacer(),
            Image.asset(
              AppImages.stars,
              height: 136,
            ),
          ],
        ),
      );
}
