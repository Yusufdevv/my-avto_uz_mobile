import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditItemContainer extends StatelessWidget {
  const EditItemContainer({
    required this.region,
    required this.icon,
    this.isOtherPage = false,
    Key? key,
  }) : super(key: key);

  final String region;
  final String icon;
  final bool isOtherPage;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
            left: SizeConfig.h(16),
            top: SizeConfig.v(12),
            bottom: SizeConfig.v(12),
            right: SizeConfig.h(10)),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(SizeConfig.h(12)),
            border: Border.all(
                color: Theme.of(context)
                    .extension<WTextFieldStyle>()!
                    .borderColor)),
        child: Row(
          children: [
            Text(
              region,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: isOtherPage ? grey : dark),
            ),
            const Spacer(),
            SvgPicture.asset(
              icon,
              color:
                  Theme.of(context).extension<ThemedColors>()!.darkGreyToWhite,
            ),
          ],
        ),
      );
}
