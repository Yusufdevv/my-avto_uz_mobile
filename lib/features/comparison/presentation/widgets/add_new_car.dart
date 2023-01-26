import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddNewCar extends StatelessWidget {
  final VoidCallback onTap;
  const AddNewCar({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 18, left: 12),
          width: (MediaQuery.of(context).size.width - 46) / 2,
          decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
            borderRadius: BorderRadius.circular(
              12,
            ),
            border: Border.all(
              color: purple,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: purple.withOpacity(
                0.1,
              ),
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(
                    6,
                  ),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: purple,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 26,
                        offset: const Offset(0, 4),
                        color: purple.withOpacity(0.4),
                      )
                    ],
                  ),
                  child: SvgPicture.asset(
                    AppIcons.addCarIcon,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  LocaleKeys.add_car.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: purple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
}
