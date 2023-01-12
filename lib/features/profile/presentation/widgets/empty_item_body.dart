import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class EmptyItemBody extends StatelessWidget {
  const EmptyItemBody(
      {required this.subtitle, this.title, required this.image, super.key});
  final String subtitle;
  final String? title;
  final String image;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.v(92),
            width: SizeConfig.v(92),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitude1ToNero),
            child: Image.asset(
              image,
              fit: BoxFit.cover
            ),
          ),
          const SizedBox(height: 24),
          if (title != null)
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.v(8)),
              child: Text(
                title!,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: black),
              ),
            )
          else
            const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .midnightExpressToGreySuit,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
