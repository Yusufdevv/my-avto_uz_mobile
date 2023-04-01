import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/widgets/radio_circle_widget.dart';
import 'package:auto/features/ad/presentation/widgets/warning_circle_widget.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DamageTypeChooseSheet extends StatefulWidget {
  final String title;
  final DamageType? initialType;

  const DamageTypeChooseSheet(
      {required this.title, required this.initialType, super.key});

  @override
  State<DamageTypeChooseSheet> createState() => _DamageTypeChooseSheetState();
}

class _DamageTypeChooseSheetState extends State<DamageTypeChooseSheet> {
  DamageType? selected;

  @override
  void initState() {
    selected = widget.initialType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      LocaleKeys.body_state.tr(),
                      style: Theme.of(context).textTheme.displayLarge,
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
            Divider(
                color: Theme.of(context).extension<ThemedColors>()!.divider,
                thickness: 1,
                height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.title.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            ...DamageType.values.map(
              (damageType) {
                if (damageType == DamageType.ideal) {
                  return const SizedBox();
                }
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => selected = damageType),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin:
                        const EdgeInsets.only(left: 16, bottom: 10, right: 16),
                    decoration: BoxDecoration(
                      color: selected == damageType
                          ? purple.withOpacity(.1)
                          : null,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        WarningCircleWidget(
                          k: MediaQuery.of(context).size.width / mockWith,
                          damageType: damageType,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          MyFunctions.getStatusTitle(damageType).tr(),
                          style: damageType == selected
                              ? Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .extension<ThemedColors>()!
                                          .blackToWhite)
                              : Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .extension<ThemedColors>()!
                                          .dolphinToWhite),
                        ),
                        const Spacer(),
                        RadioCircleWidget(selected: damageType == selected)
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
            WButton(
              onTap: () {
                Navigator.of(context).pop(selected);
              },
              color: orange,
              text: LocaleKeys.save.tr(),
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: white),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 20,
                top: 20,
                left: 16,
                right: 16,
              ),
            ),
          ],
        ),
      );
}
