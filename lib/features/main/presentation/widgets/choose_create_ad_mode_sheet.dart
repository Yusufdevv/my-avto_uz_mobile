import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseCreateAdModeSheet extends StatefulWidget {
  const ChooseCreateAdModeSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseCreateAdModeSheet> createState() =>
      ChooseCreateAdModeSheetState();
}

class ChooseCreateAdModeSheetState extends State<ChooseCreateAdModeSheet> {
  int? selected = 0;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToBlack,
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListView.separated(
            separatorBuilder: (context, index) => Container(
              height: 1,
              color:
                  Theme.of(context).extension<ThemedColors>()!.greyToDarkRider,
            ),
            itemCount: 2,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => WScaleAnimation(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(index == 0 ? 'Clear State' : 'Continue',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 6),
                    if (index == selected) ...{
                      SvgPicture.asset(
                        AppIcons.check,
                        color: orange,
                        height: 14,
                      ),
                      const SizedBox(width: 16)
                    }
                  ],
                ),
              ),
            ),
          ),
          WButton(
            margin: const EdgeInsets.symmetric(vertical: 20),
            onTap: () {
              Navigator.of(context).pop(selected);
            },
            child: Text(
              LocaleKeys.confirm.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ]),
      );
}
