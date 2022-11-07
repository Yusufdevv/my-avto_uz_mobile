import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddedCar extends StatelessWidget {
  const AddedCar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .solitudeContainerToBlack,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Stack(
          children: [
            Container(
              width: (MediaQuery.of(context).size.width - 46) / 2,
              padding: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeContainerToBlack,
                  borderRadius: BorderRadius.circular(12)),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .solitude2ToNightRider),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 112,
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: SvgPicture.asset(AppImages.placeHolder,
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '227 000 000 UZS',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 13),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Lexus LX 600 2022',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 0,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Stack(
                  children: [
                    SvgPicture.asset(AppIcons.roundedClose),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: WScaleAnimation(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.tablerPhone, color: white),
                      const SizedBox(width: 4),
                      Text(
                        LocaleKeys.call.tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
