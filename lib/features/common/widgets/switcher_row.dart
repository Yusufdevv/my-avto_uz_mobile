import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_cupertino_switch.dart';
import 'package:flutter/material.dart';

class SwitcherRow extends StatelessWidget {
  final String title;
  final bool value;
  final VoidCallback? onTap;
  final ValueChanged<bool> onChanged;
  final bool isAsButton;
  const SwitcherRow(
      {required this.value,
      required this.onChanged,
      required this.title,
      this.onTap,
      this.isAsButton = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => onTap == null || value
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: greyText),
            ),
            WCupertinoSwitch(width: 40, isSwitched: value, onChange: onChanged),
          ],
        )
      : GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: greyText),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 40,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .stormGrey16ToStormGrey32,
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 2),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                    border:
                        Border.all(color: dark.withOpacity(0.04), width: 0.5),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          offset: const Offset(0, 3),
                          color: dark.withOpacity(0.06)),
                      BoxShadow(
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                          color: dark.withOpacity(0.15)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
}
