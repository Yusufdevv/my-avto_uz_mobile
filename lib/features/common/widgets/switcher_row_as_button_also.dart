import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class SwitcherRowAsButtonAlso extends StatelessWidget {
  final String title;
  final bool value;
  final VoidCallback onTap;
  
  final Function(bool) onChanged;
  const SwitcherRowAsButtonAlso(
      {required this.value,
      required this.onChanged,
      required this.title,
      required this.onTap,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
            onChanged(!value);
          if (value) {
            return;
          }
          onTap();
        },    behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.length > 36?'${title.substring(0,35)}..':title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: greyText),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              width: 40,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: value
                    ? green
                    : Theme.of(context)
                        .extension<ThemedColors>()!
                        .stormGrey16ToStormGrey32,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white,
                  border: Border.all(color: dark.withOpacity(0.04), width: 0.5),
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
