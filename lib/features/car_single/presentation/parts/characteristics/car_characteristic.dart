import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/widgets/door_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarCharacteristic extends StatelessWidget {
  const CarCharacteristic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider,
            ),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.auto_characters.tr(),
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
            ),
            Row(
              children: [
                SvgPicture.asset(AppIcons.doubleCheck),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  LocaleKeys.checked_by_autouz.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  Image.asset(
                    AppImages.carFromLeft,
                  ),
                  Positioned(
                    right: 35,
                    top: 25,
                    child: SvgPicture.asset(AppIcons.blueCheckRounded),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        AppImages.carFromOpposite,
                      ),
                      Positioned(
                        bottom: 7,
                        left: 83,
                        child: SvgPicture.asset(AppIcons.redWarning),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    AppImages.carFromBack,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  Image.asset(
                    AppImages.carFromRight,
                  ),
                  Positioned(
                    left: 35,
                    top: 25,
                    child: SvgPicture.asset(AppIcons.blueWarning),
                  ),
                  Positioned(
                    right: 50,
                    top: 29,
                    child: SvgPicture.asset(
                      AppIcons.yellowWarning,
                    ),
                  ),
                ],
              ),
            ),
            const DoorItem(
              title: 'Левая передняя дверь',
              subtitle: 'Идеальное',
              title2: 'Левая задняя дверь',
              subtitle2: 'Идеальное',
            ),
            const Divider(),
            const DoorItem(
              title: 'Левая передняя дверь',
              subtitle: 'Идеальное',
              title2: 'Левая задняя дверь',
              subtitle2: 'Идеальное',
            ),
            const Divider(),
            const DoorItem(
              title: 'Левая передняя дверь',
              subtitle: 'Идеальное',
              title2: 'Левая задняя дверь',
              subtitle2: 'Идеальное',
            ),
            const Divider(),
            const DoorItem(
              title: 'Левая передняя дверь',
              subtitle: 'Идеальное',
              title2: 'Левая задняя дверь',
              subtitle2: 'Идеальное',
            ),
          ],
        ),
      );
}
