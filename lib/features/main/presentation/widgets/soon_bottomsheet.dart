import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoonBottomsheet extends StatelessWidget {
  const SoonBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              SizedBox(
                  height: 150, width: 150, child: Image.asset(AppImages.pl2)),
              const Spacer(),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  behavior: HitTestBehavior.opaque,
                  child:
                      SvgPicture.asset(AppIcons.close, height: 32, width: 32)),
            ],
          ),
          const SizedBox(height: 8),
          Text(LocaleKeys.very_soon.tr(),
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(
            LocaleKeys.our_team_developers.tr(),
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.w400, fontSize: 16, color: greyText),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.079),
          WButton(
              color: orange,
              onTap: () => Navigator.pop(context),
              text: LocaleKeys.superr.tr(),
              textColor: white)
        ],
      ),
    );
  }
}
