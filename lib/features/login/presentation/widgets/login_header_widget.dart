import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final String title;
  final String description;
  final bool hasSizedBox;

  const LoginHeader(
      {required this.title,
      required this.description,
      this.hasSizedBox = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: hasSizedBox ? 48 : 0,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .greySuitToWhite60,
                ),
          ),
        ],
      );
}
