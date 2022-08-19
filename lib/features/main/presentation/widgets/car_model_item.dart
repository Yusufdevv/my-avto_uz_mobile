import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/main/presentation/pages/select_car_model.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarModelItem extends StatelessWidget {
  const CarModelItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToWhite8,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 19,
                  color: dark.withOpacity(.07))
            ]),
        child: Column(
          children: [
            WButton(
              onTap: () => Navigator.push(
                  context, fade(page: const SelectCarModelScreen())),
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToGondola,
              border: Border.all(
                width: 1,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToPayneGrey,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.vehicle,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    width: 2,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToCharcoal,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Выберите марку и модель',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 14,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .midnightExpressToDolphin),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            WButton(
              onTap: () {},
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .lightSlateBlue12ToLightSlateBlue,
              border: Border.all(
                width: 1,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToPayneGrey,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              text: 'Показать 161 675  предложений',
              textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 14,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .mediumSlateBlueToWhite),
            ),
          ],
        ),
      );
}
