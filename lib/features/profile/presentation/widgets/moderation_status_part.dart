import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ModerationStatusPart extends StatelessWidget {
  const ModerationStatusPart({required this.moderationStatus, super.key});
  final String moderationStatus;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (moderationStatus == 'blocked')
            ModerationWidget(
              title: 'Заблокировано модератором',
              titleColor: red,
              svgPath: AppIcons.info,
              color: red.withOpacity(0.1),
            )
          else if (moderationStatus == 'sold')
            ModerationWidget(
              title: 'Продано',
              titleColor: emerald,
              color: green.withOpacity(0.1),
            )
          else
            const SizedBox()
        ],
      );
}

class ModerationWidget extends StatelessWidget {
  const ModerationWidget({
    required this.title,
    required this.color,
    required this.titleColor,
    this.svgPath,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? svgPath;
  final Color color;
  final Color titleColor;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: color),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w400, color: titleColor),
                  ),
                  if (svgPath == null)
                    const SizedBox()
                  else
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: SvgPicture.asset(svgPath!, color: red),
                    )
                ],
              ),
            )),
      );
}
