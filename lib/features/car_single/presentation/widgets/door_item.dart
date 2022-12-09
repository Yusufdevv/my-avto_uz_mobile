import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoorItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String title2;
  final String subtitle2;

  const DoorItem(
      {required this.title,
      required this.subtitle,
      required this.title2,
      required this.subtitle2,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(
          top: 12,
          right: 8,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.checkRounded,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: grey),
                        ),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.checkRounded,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: grey),
                        ),
                        Text(
                          subtitle2,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}
