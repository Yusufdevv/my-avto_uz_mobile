import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectCarCharactersItem extends StatelessWidget {
  const SelectCarCharactersItem({
    required this.title,
    required this.onTap,
    this.subtitle,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => WButton(
        onTap: onTap,
        color: white,
        height: 54,
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: subtitle == null ? 16 : 13),
          ),
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 16, color: dark),
                ),
          trailing: SvgPicture.asset(AppIcons.chevronRight, color: darkGray),
        ),
      );
}
