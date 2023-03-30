import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/widgets/warning_circle_widget.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DamageTypeInfoSheet extends StatelessWidget {
  DamageTypeInfoSheet({required this.k});

  final double k;
  final infos = [
    LocaleKeys.info_ideal.tr(),
    LocaleKeys.info_scratched.tr(),
    LocaleKeys.info_replacement.tr(),
    LocaleKeys.info_replacement_not_required.tr(),
    LocaleKeys.info_replacement_required.tr(),
  ];

  @override
  Widget build(BuildContext context) =>
      Padding(
        padding:
        EdgeInsets.only(top: MediaQuery
            .of(context)
            .viewInsets
            .top + 60),
        child: Container(
          decoration:  BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              color: Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        LocaleKeys.information.tr(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .displayLarge,
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        AppIcons.close,
                        height: 24,
                        width: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
               Divider(color: Theme.of(context).extension<ThemedColors>()!.divider, thickness: 1, height: 1),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  shrinkWrap: true,
                  itemCount: DamageType.values.length,
                  itemBuilder: (context, index) =>
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Theme.of(context).extension<ThemedColors>()!.divider, width: 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                WarningCircleWidget(
                                  k:k,
                                  damageType: DamageType.values[index],),
                                const SizedBox(width: 12),
                                Text(
                                  MyFunctions.getStatusTitle(
                                      DamageType.values[index])
                                      .tr(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              infos[index],
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .darkGreyToWhite),
                            )
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 16),
                ),
              ),
              WButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                color: orange,
                text: LocaleKeys.understandably.tr(),
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: white),
                margin: EdgeInsets.only(
                  bottom: MediaQuery
                      .of(context)
                      .padding
                      .bottom + 20,
                  top: 20,
                  left: 16,
                  right: 16,
                ),
              ),
            ],
          ),
        ),
      );
}
