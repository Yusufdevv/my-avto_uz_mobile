import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneContainer extends StatelessWidget {
  const PhoneContainer({
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
            left: SizeConfig.h(16),
            top: SizeConfig.v(4),
            bottom: SizeConfig.v(4),
            right: SizeConfig.h(4)),
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
              phoneNumber,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Container(
                padding: EdgeInsets.all(SizeConfig.h(8)),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 20,
                        color: dividerColor.withOpacity(0.2))
                  ],
                  borderRadius: BorderRadius.circular(SizeConfig.h(8)),
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .borderGreyToDark,
                ),
                child: SvgPicture.asset(AppIcons.edit,
                    height: SizeConfig.v(20),
                    width: SizeConfig.h(20),
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .darkGreyToWhite)),
          ],
        ),
      );
}
