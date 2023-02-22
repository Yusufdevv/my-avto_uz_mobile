import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenuTile extends StatelessWidget {
  final String iconPath;
  final String name;
  final int? count;
  final VoidCallback onTap;

  const ProfileMenuTile({
    required this.name,
    required this.onTap,
    required this.iconPath,
    this.count,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(iconPath),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      Text(
                        name,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (count != null) ...{
                    Text(
                      count.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    )
                  },
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    AppIcons.chevronRight1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .darkGreyToWhite,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
