import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallLikeItem extends StatelessWidget {
  final String icon;
  final String number;
  final String text;

  const CallLikeItem({
    required this.icon,
    required this.number,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 17,
                height: 17,
                color: orange,
              ),
              const SizedBox(width: 2),
              Text(
                number,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .darkToWhite),
              )
            ],
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400, color: greyText),
          ),
        ],
      );
}
